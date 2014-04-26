# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'getty_connect_authentication/version'

Gem::Specification.new do |spec|
  spec.name          = "getty_connect_authentication"
  spec.version       = GettyConnectAuthentication::VERSION
  spec.authors       = ["Cymen Vig"]
  spec.email         = ["cymenvig@gmail.com"]
  spec.summary       = "Authentication for the Getty Images Connect API"
  spec.description   = "Fetch authentication tokens from the Getty Images Connect API v2"
  spec.homepage      = "https://github.com/cymen/getty_connect_authentication"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0") - %w(config.yml .ruby-gemset .ruby-version .gitignore)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "webmock", "~> 1.17"
end
