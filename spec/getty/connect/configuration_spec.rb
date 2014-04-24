require 'spec_helper'

describe GettyConnect::Configuration do

  it 'returns nil by default for id' do
    GettyConnect::Configuration.id.should be_nil
  end

  it 'returns nil by default for secret' do
    GettyConnect::Configuration.secret.should be_nil
  end

  it 'can be configured with a YAML file' do
    GettyConnect::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'a.yml'))

    GettyConnect::Configuration.id.should == 'abc123'
    GettyConnect::Configuration.secret.should == 'big_secret'
  end

  it 'raises an error if the file is not present' do
    expect { GettyConnect::Configuration.load('does_not_exist.yml') }.to raise_error
  end

  it 'raises an error if the file is not valid YAML' do
    expect {
      GettyConnect::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'b.yml'))
    }.to raise_error
  end
end
