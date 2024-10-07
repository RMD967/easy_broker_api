require 'httparty'
require 'json'

class EasyBrokerApi
  include HTTParty
  base_uri 'https://api.stagingeb.com/v1'

  def initialize(api_key)
    @options = {
      headers: {
        'X-Authorization' => api_key
      }
    }
  end

  def properties
    response = self.class.get('/properties', @options)
    JSON.parse(response.body)['content']
  end
end

# Ejemplo de uso:
api_key = 'TU_API_KEY'  # El API key de staging
easy_broker = EasyBrokerApi.new(api_key)
properties = easy_broker.properties

properties.each do |property|
  puts property['title']
end
