describe 'POST New Cart ' do
  it "Addes new cart", :post do  
    api = ClientApi::Api.new
    api.post('/carts',  payload("./data/request/add_new_cart.json"))

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/request/add_new_cart.json"))
    validate_schema(schema_from_json("./data/schema/add_new_cart.json"), api.body)
  end
end