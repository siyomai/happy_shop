describe "Products API" do
  describe "Product INDEX" do
    it 'renders all products' do
      FactoryGirl.create_list(:product, 10)

      get '/api/products'

      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to be_success

      # check to make sure the right amount of messages are returned
      expect(json['data'].length).to eq(10)
    end

    it 'renders all products with pagination' do
      FactoryGirl.create_list(:product, 10)

      get '/api/products?per_page=5'

      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to be_success

      # check to make sure the right amount of messages are returned
      expect(json['data'].length).to eq(5)
      expect(json['links']).not_to eq({})
    end
  end

  describe 'Product SHOW' do
    it 'renders product based on ID' do
      product = FactoryGirl.create(:product)

      get "/api/products/#{product.id}"

      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response).to be_success

      # check to make sure the right amount of messages are returned
      expect(json['data']['attributes']['name']).to eq("Avon lipstick")
    end

    it 'renders error when passed with the wrong ID' do
      product = FactoryGirl.create(:product)

      get "/api/products/99"

      json = JSON.parse(response.body)

      # test for the 200 status-code
      expect(response.status).to eq 404

      # check to make sure the right amount of messages are returned
      expect(json['errors'][0]['detail']).to eq("Wrong ID provided")
    end
  end
end
