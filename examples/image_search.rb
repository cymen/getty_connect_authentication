$:.unshift File.expand_path('../../lib', __FILE__)
require 'getty_connect'

GettyConnect::Configuration.load(File.join(Dir.pwd, '..', 'config.yml'))
@token = GettyConnect.token
query = {
  Query: {
    SearchPhrase: 'tree'
  },
  Filter: {
    GraphicStyles: [ 'Illustration' ]
  }
}
puts GettyConnect::ImageSearch.run(@token, query)