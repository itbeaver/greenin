# Greenin
[![Gem Version](https://badge.fury.io/rb/greenin.svg)](http://badge.fury.io/rb/greenin)
[![Build Status](https://travis-ci.org/itbeaver/greenin.svg?branch=develop)](https://travis-ci.org/itbeaver/greenin)
[![Code Climate](https://codeclimate.com/github/itbeaver/greenin/badges/gpa.svg)](https://codeclimate.com/github/itbeaver/greenin)
[![Test Coverage](https://codeclimate.com/github/itbeaver/greenin/badges/coverage.svg)](https://codeclimate.com/github/itbeaver/greenin)
[![Dependency Status](https://gemnasium.com/itbeaver/greenin.svg)](https://gemnasium.com/itbeaver/greenin)

Describe your Grape Entities in Rails Active Record models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'greenin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install greenin

Then run

	$ rails g greenin:install

This generator creates an initializer with settings at `config/initializers/greenin_initializer.rb`. You can change method name and class name:
```ruby
Greenin.setup do |config|
  config.entity_method_name = 'entity'
  config.entity_class_name = 'Entity'
end

```

## Usage

Example describtion in Post model:

```ruby
class Post < ActiveRecord::Base

  # ...

  class Entity < Grape::Entity
    format_with(:unix) { |dt| dt.to_i }
    root 'posts'

    expose :id
    with_options(format_with: :unix) do
      expose :created_at
      expose :updated_at
    end
    expose :title
    expose :description
  end

end
```

So, now you can call entity like that:
```ruby
Post::Entity
# => Post::Entity

Post.entity
# => Post::Entity

Post.all.entity
# => #<Post::Entity:0x007fb4610d8a00
#    @object=#<ActiveRecord::Relation [...]>, @options={}>

Post.first.entity
# => #<Post::Entity:0x007fb462263090 @object=
#    #<Post id: nil, ..., created_at: nil, updated_at: nil>, @options={}>
```

## Contributing

1. Fork it ( https://github.com/itbeaver/greenin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
