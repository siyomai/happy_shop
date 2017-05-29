FactoryGirl.define do
  factory :product do
    name "Avon lipstick"
    sold_out false
    category "lipstick"
    under_sale false
    price 1
    sale_price 1
  end
end
