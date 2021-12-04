describe 'POST New User ' do
  it "Addes new user", :post do  
    api = ClientApi::Api.new
    api.post('/users',  payload("./data/request/add_new_user.json"))

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/response/add_new_user.json"))
    validate_schema(schema_from_json("./data/schema/add_new_user.json"), api.body)
  end
end