[![hexlet-check](https://github.com/EskovDMTA/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/EskovDMTA/rails-project-63/actions/workflows/hexlet-check.yml)   [![RUBY](https://github.com/EskovDMTA/rails-project-63/actions/workflows/ruby.yml/badge.svg)](https://github.com/EskovDMTA/rails-project-63/actions/workflows/ruby.yml)
# Hexlet::Code

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet/code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet-code

## Usage
Define a User structure with three fields: name, job.The **keyword_init: true** parameter allows named arguments to be used when creating a User object
```ruby
User = Struct.new(:name, :job, keyword_init: true)
```
Create a new user object of type User and initialize it with the values for the name, job and gender fields
```ruby
user = User.new name: 'rob', job: 'hexlet'
```
Creating a form using a user object. Object |f| is an instance of the **HexletCode::FormBuilder** class that provides methods for creating form elements.
Label is added to fields automatically

```ruby
HexletCode.form_for user do |f|
  # f.input :name creates an input field for the name value of the user object. If the name value exists, it will be displayed in the input field.
  f.input :name
  #f.input :job, as: :text creates an input field for the job value of the user object, but using a textarea field instead of a regular input field.
  f.input :job, as: :text
  # f.submit "Wow" create input field with type "submit". And we can enter text for the button. Base text value for button "Save"
  f.submit "Wow"
end
# =>
# <form action="#" method="post">
# <label for="name">Name</label>
# <input name="name" type="text" value="rob">
# <label for="job">Job</label>
# <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```
For fields, you can specify additional attributes in the form of a hash as the last parameter
```ruby
HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end
# =>
# <form action="#" method="post">
# <label for="name">Name</label>
# <input name="name" type="text" value="rob" class="user-input">
# <label for="job">Job</label>
# <input name="job" type="text" value="hexlet">
# </form>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet-code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
