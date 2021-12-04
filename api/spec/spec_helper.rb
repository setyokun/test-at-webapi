require "client-api"

ClientApi.configure do |config|
  config.base_url = 'https://fakestoreapi.com/'
  config.headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json'}

  config.before(:each) do |scenario|
    ClientApi::Request.new(scenario)
  end
end
