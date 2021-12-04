describe 'GET All Carts' do
  it "View all carts", :get do  
    api = ClientApi::Api.new
    api.get('/carts')

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/response/get_all_carts.json")) 
    validate_schema(schema_from_json("./data/schema/get_all_carts.json"), api.body)
  end
end