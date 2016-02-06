# EikValidator

This gem allows you to validate whether a Bulgarian EIK (UIC - Unique Identifier Code) is valid or not. It follows the algorhitm described [here](http://bulstat.registryagency.bg/Fr-about2.html#Structure).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eik_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eik_validator

## Usage

The usage is pretty straightforward:
```ruby
EikValidator.validate('123456789') # => false
EikValidator.validate('020469788') # => true

EikValidator.validate('1234567891234') # => false
EikValidator.validate('1213961230342') # => true
```

## Contributing

This is my first gem ever so suggestions are more that appreciated.
Bug reports and pull requests are welcome on GitHub at https://github.com/veskoy/eik_validator.

