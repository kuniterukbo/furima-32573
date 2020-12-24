class Item < ApplicationRecord

  with_options presence: true do
    validates :product_name
    validates :product_explanation
    validates :category_id
    validates :product_state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_date_id
    validates :selling_price
    validates :user
  end

  has_one :purchase_history
  belongs_to :user
end