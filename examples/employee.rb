$LOAD_PATH.unshift("../lib")

require 'alloy'
require './person_interface'

class Employee
  include Alloy

  def say_hello
    puts 'Hello from employee!'
  end

  def say_goodbye

  end

  def self.dance

  end

  adheres_to PersonInterface
end