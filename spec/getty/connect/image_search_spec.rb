require 'spec_helper'

describe GettyConnect::ImageSearch do

  describe 'uri' do

    it 'returns the URI' do
      GettyConnect::ImageSearch.uri.to_s.should == 'https://connect.gettyimages.com/v2/search/SearchForImages'
    end

  end

  describe 'run' do
    url = nil

    before(:each) do
      url = GettyConnect::ImageSearch.uri.to_s
    end

    it 'sends the query to the API' do
        stub_request(:any, url).to_return(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: {a_key: 'a_value'}.to_json
        )

        GettyConnect::ImageSearch.run('my_token', {Query: { SearchPhrase: 'bird' }})


        a_request(:post, url).
          with(body: '{"RequestHeader":{"Token":"my_token"},"SearchForImagesRequestBody":{"ResultOptions":{"ItemCount":10,"ItemStartNumber":1},"Query":{"SearchPhrase":"bird"}}}').should have_been_made.once
    end

  end

end
