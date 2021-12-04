describe 'GET All Users' do
  it "View all users", :get do  
    api = ClientApi::Api.new
    api.get('/users')

    expect(api.code).to eq(200)
    expect(api.message).to eq('OK')
    validate_json(api.body, payload("./data/response/get_all_users.json")) 
    validate_schema(schema_from_json("./data/schema/get_all_users.json"), api.body)
  end
end