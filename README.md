# Thyng

##### Ruby objects with public state to encourage storage as data only collections.

### What?
A `thyng` is a ruby object with the convention of saving state in **key:value** pairs that are public on the object rather than in private **instance variables**.

### How?
Instead of private attributes a `thyng` has public aspects. Basic access to these can be declared with `asect_reader`, `aspect_write` & `aspect_accessor`.

### Why?
Will all internal state a `thyng` can be reconstructed completly from its data. This allows it to be passed as JSON a json object and easily be stored in a database.

### Simple example

```ruby
class Person < Thyng
  aspect_accessor :name
end

person = Person.new
# => {}

person.name = 'Fester'

puts person
# => {name: 'Fester'}
``` 

### Show me the money
*Thyng objects are subclassed from ruby hashes. This means most database orm's know exactly how handle them*

```ruby
class Person < Thyng
  aspect_accessor :name
  aspect_accessor :age
end

class Credentials < Thyng
  aspect_accessor :email
  crypted_accessor :password # <- Oooh!
end

person = Person.new name: 'Morticia', age: '41'
credentials = Credentials.new email: 'm@addams.biz', password: 'password'

record = Record.last

record.set person
record.set credentials

record.save
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thyng'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thyng

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/thyng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
