require 'spec_helper'

describe GettyConnect do

  specify 'token_invalid? returns true by default' do
    GettyConnect.token_invalid?.should be_true
  end

  specify 'uri returns the URI' do
    GettyConnect.uri.to_s.should == 'https://connect.gettyimages.com/oauth2/token'
  end

  describe 'token' do
    url = nil

    before(:each) do
      GettyConnect.reset
      GettyConnect::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'getty.yml'))
      url = "#{GettyConnect::BASE_URI}/oauth2/token"
    end

    it 'sends a request to BASE_URI/oauth2/token' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 10}.to_json
      )

      GettyConnect.token

      a_request(:post, url).
        with(body: "client_id=my_id&client_secret=my_secret&grant_type=client_credentials").should have_been_made.once
    end

    it 'sets expires to current timestamp plus response expires_in value' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 10}.to_json
      )

      GettyConnect.token

      GettyConnect.expires.should be_within(1).of(Time.now.to_i + 10)
    end

    it 'returns the token in the response' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'the_token', expires_in: 10}.to_json
      )

      GettyConnect.token.should == 'the_token'
    end

    it 'does not request another token if the current token is still valid' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 10}.to_json
      )

      GettyConnect.token
      GettyConnect.token

      a_request(:post, url).should have_been_made.once
    end

    it 'does request another token when the current token has expired' do
      stub_request(:any, url).to_return(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {access_token: 'a', expires_in: 1}.to_json
      )

      GettyConnect.token
      GettyConnect.reset
      GettyConnect.token_invalid?.should == true
      GettyConnect.token

      a_request(:post, url).should have_been_made.twice
    end

    it 'raises an error if the response code is not 200' do
      stub_request(:any, url).to_return(status: 403)

      expect { GettyConnect.token }.to raise_error
    end

  end
end
