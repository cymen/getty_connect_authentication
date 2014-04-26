require 'getty_connect/version'
require 'getty_connect/configuration'
require 'getty_connect/image_search'
require 'json'
require 'net/http'
require 'uri'

module GettyConnect
  BASE_URI = 'https://connect.gettyimages.com'
  PATH = 'oauth2/token'

  def self.token
    uri = self.uri
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.is_a?(URI::HTTPS)

    body = {
      client_id: Configuration.id,
      client_secret: Configuration.secret,
      grant_type: 'client_credentials'
    }

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(body)
    response = http.request(request)

    case response.code.to_i
    when 200
      JSON.parse(response.body)
    else
      raise "#{response.code} response code with body: #{response.body}"
    end
  end

  def self.uri
    URI.parse "#{BASE_URI}/#{PATH}"
  end

  def self.reset
    @token = nil
    @expires = nil
  end
end
