$:.unshift File.expand_path('../../lib', __FILE__)
require 'getty_connect'

GettyConnect::Configuration.load(File.expand_path('../../config.yml', __FILE__))
puts GettyConnect.token
