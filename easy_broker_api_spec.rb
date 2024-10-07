require 'spec_helper'
require 'webmock/rspec'

RSpec.describe EasyBrokerApi do
  let(:api_key) { 'YOUR_API_KEY' }
  let(:client) { EasyBrokerApi.new(api_key) }

  before do
    stub_request(:get, 'https://api.stagingeb.com/v1/properties').
      with(headers: {'X-Authorization'=>'YOUR_API_KEY'}).
      to_return(status: 200, body: File.read('spec/fixtures/properties.json'), headers: {})
  end

  it 'returns a list of properties' do
    properties = client.properties
    expect(properties.first['title']).to eq('Beautiful property in Condesa.')
  end
end
