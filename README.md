# GettyConnect

Access the Getty Connect API.

## Installation

Add this line to your application's Gemfile:

    gem 'getty_connect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install getty_connect

## Usage

### Configuration

`config/initializers/getty_connect.rb`:

    require 'getty_connect'
    GettyConnect::Configuration.load(File.join(Rails.root, 'config', 'getty_connect.yml'))

### Examples

See the examples directory.

## Contributing

1. Fork it ( https://github.com/cymen/getty_connect/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
