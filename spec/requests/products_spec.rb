describe "Products API" do
  it 'lists all products' do
    FactoryGirl.create_list(:product, 10)

    get '/api/products'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['data'].length).to eq(10)
  end

  it 'lists all products with pagination' do
    FactoryGirl.create_list(:product, 10)

    get '/api/products?per_page=5'

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['data'].length).to eq(5)
    expect(json['links']).not_to eq({})
  end

  it 'lists one product' do
    product = FactoryGirl.create(:product)

    get "/api/products/#{product.id}"

    json = JSON.parse(response.body)

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['data']['attributes']['name']).to eq("Avon lipstick")
  end

end
