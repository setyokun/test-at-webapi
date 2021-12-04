describe 'POST New Products ' do
  it "Addes new product", :post do  
    api = ClientApi::Api.new
    api.post('/products',  payload("./data/request/add_new_product.json"))

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/request/add_new_product.json"))
    validate_schema(schema_from_json("./data/schema/add_new_product.json"), api.body)
  end
end