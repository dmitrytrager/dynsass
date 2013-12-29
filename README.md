# Dynsass

Generates custom Sass stylesheet that will be compiled dynamically during runtime.

## Installation

Add this line to your application's Gemfile:

    gem 'dynsass'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dynsass

## Usage

Just run generator with following command:

    $ rails generate dynsass:create_stylesheet

This will copy scss.erb file into sass directory and main lib file into lib/classes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
