class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id 
    validates :municipality
    validates :address 
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code , prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end

  
end