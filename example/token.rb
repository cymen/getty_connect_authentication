$:.unshift File.expand_path('../../lib', __FILE__)
require 'getty_connect_authentication'

GettyConnectAuthentication::Configuration.load(File.expand_path('../../config.yml', __FILE__))
puts GettyConnectAuthentication.token
