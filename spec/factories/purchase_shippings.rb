FactoryBot.define do
  factory :purchase_shipping do
    postal_code {"123-4567"}
    prefecture_id {2}
    municipality {"横浜市"}
    address {"あああ1-1"}
    building_name{"あああ"}
    phone_number{"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
