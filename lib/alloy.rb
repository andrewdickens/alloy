require "alloy/version"

module Alloy
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
  # Your code goes here...
    def adheres_to klass
      #klass = klass_name.klass
      puts "adheres to: #{klass.name}"

      (klass.instance_methods - Object.instance_methods).each do |method_name|
        puts "instance method: #{klass.name}##{method_name}"
      end
      (klass.public_methods - Object.public_methods).each do |method_name|
        method = klass.method(method_name)
        puts "class method: #{klass.name}##{method.name} params: #{method.parameters.inspect}"
      end
    end
  end
end

class String
  def klass
    self.split('::').inject(Object) do |mod, class_name|
      mod.const_get(class_name)
    end
  end
end