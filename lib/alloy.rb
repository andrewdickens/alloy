require "alloy/version"

module Alloy
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def adheres_to klass
      my_instance_methods = self.instance_methods - Object.instance_methods
      my_public_methods = self.public_methods - Object.public_methods

      interface_instance_methods = klass.instance_methods - Object.instance_methods
      interface_public_methods = klass.public_methods - Object.public_methods

      unimplemented_instance_methods = interface_instance_methods - my_instance_methods
      unimplemented_public_methods = interface_public_methods - my_public_methods

      if unimplemented_instance_methods.size > 0
        raise "Unimplemented instance methods: #{unimplemented_instance_methods}"
      end

      if unimplemented_public_methods.size > 0
        raise "Unimplemented public methods: #{unimplemented_public_methods}"
      end
    end
  end
end
