require 'json'
require 'net/http'
require 'uri'

module GettyConnect
  module ImageSearch
    PATH = '/v2/search/SearchForImages'

    def self.run(token, query, offset=1, count=10)
      body = {
        RequestHeader: {
          Token: token
        },
        SearchForImagesRequestBody: {
          ResultOptions: {
            ItemCount: count,
            ItemStartNumber: offset
          }
        }
      }

      body[:SearchForImagesRequestBody].merge! query

      uri = self.uri
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.is_a?(URI::HTTPS)

      response = http.post(uri.path, body.to_json, {'Content-Type' =>'application/json'})
      JSON.parse(response.body)
    end

    def self.uri
      URI.parse "#{GettyConnect::BASE_URI}#{PATH}"
    end

  end
end
