FactoryBot.define do
  factory :item do
    product_name {"あああ"}
    product_explanation {"ああああああああああああ"}
    category_id {2}
    product_state_id {2}
    shipping_charge_id {2}
    prefecture_id {2}
    delivery_date_id {2}
    selling_price {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
