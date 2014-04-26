# GettyConnectAuthentication

Access the Getty Connect API.

## Installation

Add this line to your application's Gemfile:

    gem 'getty_connect_authentication'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install getty_connect_authentication

## Completion

Only a subset of the API is implemented so far:

* getting a token
* searching for images

## Usage

### Configuration

`config/initializers/getty_connect_authentication.rb`:

    require 'getty_connect_authentication'
    GettyConnectAuthentication::Configuration.load(File.join(Rails.root, 'config', 'getty_config.yml'))

`getty_config.yml`:

    id: provided by Getty
    secret: provided by Getty

### Examples

See the example directory.

## Contributing

1. Fork it ( https://github.com/cymen/getty_connect_authentication/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
