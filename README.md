# Alloy

A library that allows you to describe an interface and then specify
that a given class must adhere to that interface. In its current state
it is mostly just an experiment but has the potential to be really
useful. Because it leverages a static method, `adheres_to`, it allows for 
the Ruby-equivalent of compile-time validation of interface completeness. 

## Installation

Add this line to your application's Gemfile:

    gem 'alloy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alloy

## Usage
```ruby
require 'alloy'

class HerpInterface
  def foo
  end

  def narf
  end
end

class Derp
  include Alloy
  
  def foo
    puts "Implemented foo!" 
  end
  
  adheres_to HerpInterface
end
```

Running this would yield an exception because adheres_to will see that you only have one of the two instance methods defined by the interface. Of course, there is no real concept of return type or parameter types in Ruby so this is really just a way of ensuring that your classes follow the right form. 

Further enhancements could include validating that the arity of the methods being implemented match up with the interface. 

For more, see examples in `examples`. 

## Contributing

1. Fork it ( https://github.com/[my-github-username]/alloy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
