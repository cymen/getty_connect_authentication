# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'getty_connect/version'

Gem::Specification.new do |spec|
  spec.name          = "getty_connect"
  spec.version       = GettyConnect::VERSION
  spec.authors       = ["Cymen Vig"]
  spec.email         = ["cymenvig@gmail.com"]
  spec.summary       = "Getty Images Connect API"
  spec.homepage      = "https://github.com/cymen/getty_connect"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "webmock"
end
