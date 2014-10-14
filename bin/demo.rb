$:.unshift("../lib")
require 'alloy'

class SweetInterface
  def foo

  end

  def narf

  end
end

class Implements
  include Alloy
  adheres_to SweetInterface
end