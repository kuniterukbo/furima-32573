class ShippingAddress < ApplicationRecord

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id 
    validates :municipality
    validates :address 
    validates :phone_number
    validates :purchase_history
  end

  belongs_to :purchase_history
end
