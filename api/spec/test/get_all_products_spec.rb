describe 'GET All Products' do
  it "View all products", :get do  
    api = ClientApi::Api.new
    api.get('/products')

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/response/get_all_products.json")) 
    validate_schema(schema_from_json("./data/schema/get_all_products.json"), api.body)
  end
end