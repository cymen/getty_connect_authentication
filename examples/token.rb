$:.unshift File.expand_path('../../lib', __FILE__)
require 'getty_connect'

GettyConnect::Configuration.load(File.join(Dir.pwd, '..', 'config.yml'))
puts GettyConnect.token
