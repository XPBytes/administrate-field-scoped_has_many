# Administrate::Field::ScopedHasMany

[![Build Status: master](https://travis-ci.com/XPBytes/administrate-field-scoped_has_many.svg)](https://travis-ci.com/XPBytes/administrate-field-scoped_has_many)
[![Gem Version](https://badge.fury.io/rb/administrate-field-scoped_has_many.svg)](https://badge.fury.io/rb/administrate-field-scoped_has_many)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

A `has_many` field that yields itself to the `scope` option.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'administrate-field-scoped_has_many'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install administrate-field-scoped_has_many

## Usage

```ruby
require "administrate/base_dashboard"

class BookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String,
    name: Field::String,
    reviews: Field::ScopedHasMany.with_options(scope: -> (field) { field.resource.publisher.approved_reviews } ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze
  
  # ...
end
```

This allows you to access the field and therefore the resource and thus any method on this resource such as scopes. You
might use this in conjunction with nested resources or settings or authorizations where you can't always rely on 
globally available data.

### Options

| option | default   | description|
|--------|-----------|------------|
| scope  | undefined | scope for the candidate resources for this field; expects a lambda with one argument (the field) |
| order | undefined | order for `reorder` to call on the candidate resources |

## Related

- [`Administrate`](https://github.com/thoughtbot/administrate): A Rails engine that helps you put together a super-flexible admin dashboard.
- [`Administrate::BaseController`](https://github.com/XPBytes/administrate-base_controller): A set of application controller improvements.

### Concerns

- [`Administrate::DefaultOrder`](https://github.com/XPBytes/administrate-default_order): Sets the default order for a resource in a administrate controller.
- [`Administrate::SerializedFields`](https://github.com/XPBytes/administrate-serialized_fields): Automatically deserialize administrate fields on form submit.

### Fields

- [`Administrate::Field::Code`](https://github.com/XPBytes/administrate-field-code): A `text` field that shows code.
- [`Administrate::Field::Hyperlink`](https://github.com/XPBytes/administrate-field-hyperlink): A `string` field that is shows a hyperlink. 
- [`Adminisrtate::Field::JsonEditor`](https://github.com/XPBytes/administrate-field-json_editor): A `text` field that shows a [JSON editor](https://github.com/josdejong/jsoneditor).
- [`Administrate::Field::ScopedBelongsTo`](https://github.com/XPBytes/administrate-field-scoped_belongs_to): A `belongs_to` field that yields itself to the scope `lambda`.  
<!-- - [`Administrate::Field::ScopedHasMany`](https://github.com/XPBytes/administrate-field-scoped_has_many): A `has_many` field that yields itself to the scope `lambda`. -->
- [`Administrate::Field::TimeAgo`](https://github.com/XPBytes/administrate-field-time_ago): A `date_time` field that shows its data as `time_ago` since.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [XPBytes/administrate-field-scoped_has_many](https://github.com/XPBytes/administrate-field-scoped_has_many).
