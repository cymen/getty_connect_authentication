require 'spec_helper'

describe GettyConnectAuthentication do

  specify 'uri returns the URI' do
    GettyConnectAuthentication.uri.to_s.should == 'https://connect.gettyimages.com/oauth2/token'
  end

  describe 'token' do
    url = nil

    before(:each) do
      GettyConnectAuthentication.reset
      GettyConnectAuthentication::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'getty.yml'))
      url = "#{GettyConnectAuthentication::BASE_URI}/oauth2/token"
    end

    it 'sends a request to BASE_URI/oauth2/token' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 10}.to_json
      )

      GettyConnectAuthentication.token

      a_request(:post, url).
        with(body: "client_id=my_id&client_secret=my_secret&grant_type=client_credentials").should have_been_made.once
    end

    it 'sets expires to current timestamp plus response expires_in value' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 10}.to_json
      )

      response = GettyConnectAuthentication.token

      response['expires_in'].should be_within(1).of(10)
    end

    it 'returns the token in the response' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'the_token', expires_in: 10}.to_json
      )

      response = GettyConnectAuthentication.token

      response['access_token'].should == 'the_token'
    end

    it 'raises an error if the response code is not 200' do
      stub_request(:any, url).to_return(status: 403)

      expect { GettyConnectAuthentication.token }.to raise_error
    end

  end
end
