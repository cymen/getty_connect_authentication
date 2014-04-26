require 'spec_helper'

describe GettyConnectAuthentication::Configuration do

  it 'returns nil by default for id' do
    GettyConnectAuthentication::Configuration.id.should be_nil
  end

  it 'returns nil by default for secret' do
    GettyConnectAuthentication::Configuration.secret.should be_nil
  end

  it 'can be configured with a YAML file' do
    GettyConnectAuthentication::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'a.yml'))

    GettyConnectAuthentication::Configuration.id.should == 'abc123'
    GettyConnectAuthentication::Configuration.secret.should == 'big_secret'
  end

  it 'raises an error if the file is not present' do
    expect { GettyConnectAuthentication::Configuration.load('does_not_exist.yml') }.to raise_error
  end

  it 'raises an error if the file is not valid YAML' do
    expect {
      GettyConnectAuthentication::Configuration.load(File.join(File.dirname(__FILE__), 'fixtures', 'b.yml'))
    }.to raise_error
  end
end
