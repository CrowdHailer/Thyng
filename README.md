# Thyng

##### Ruby objects with public state to encourage storage as data only collections.

#### What?
A `thyng` is a ruby object with the convention of saving state in **key:value** pairs that are public on the object rather than in private **instance variables**.

#### How?
Instead of private attributes a `thyng` has public aspects. Basic access to these can be declared with `asect_reader`, `aspect_write` & `aspect_accessor`.

#### Why?
With all state external a `thyng` can be reconstructed completly from its data. This allows it to be passed as JSON or easily stored in a database.

#### Simple example

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

#### Show me the money
*Thyng objects are subclassed from ruby hashes. This means most database orm's know exactly how handle them*

```ruby
class Person < Thyng
  aspect_accessor :name
  aspect_accessor :age
end

class Credentials < Thyng
  extend Thyng::CryptedAspect

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

#### Plain aspects
*See introduction Example*

#### Crypted aspects
To use this you must first add the module to thyng or your subclass of thyng. This will add the `crypted_accessor` method to your class.

`crypted_accessor` takes an aspect and adds five methods to you class. These are reader and writer methods for both the Bcrypt object and raw crypted string, as well as a check_aspect method

**Example**
```ruby
class Credentials < Thyng
  extend Thyng::CryptedAspect

  aspect_accessor :email
  crypted_accessor :password
end

credentials = Credentials.new email: 'test@example.com', password: 'password'
# => {:email=>"test@example.com", "crypted_password"=>"$2a$10$Bw4qH9Hp3iMG7c97SIBgJ.ahpXbL8M95FyDU7O.UHo4zgnxcm3bBi"} 

credentials.password.class
# => BCrypt::Password 

credentials.crypted_password.class
# => BCrypt::Password 

credentials.check_password? 'password'
# => true 

password_hash = BCrypt::Password.create('secret')
# => "$2a$10$O5DChGjqYxAU7yxo/J9.7uK55XPeWQxP0hU7nPYQNE85yDbl3H3I6" 

credentials.crypted_password = password_hash
# => "$2a$10$O5DChGjqYxAU7yxo/J9.7uK55XPeWQxP0hU7nPYQNE85yDbl3H3I6" 

credentials.check_password? 'secret'
# => true 

``` 

## Contributing

1. Fork it ( https://github.com/CrowdHailer/thyng/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Discussion

- Only settable once aspects, for managing database id's
- Default values, distinct behaviour
  - fills value on initialize
  - sets value when first asked for
  - returns default but does not set it
    ```rb
    item.compound.aspect = 5
    item.compount.aspect
    # => nil Because compound is null object and will not reset compount on item

    item.compound = Compound.new aspect: 5
    item.compount.aspect
    # => 5 Nil compound is overwritten
    ```

- Code Climate
- Code Ship
- Mutation testing

