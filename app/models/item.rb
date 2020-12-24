class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :delivery_date

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

  validates :category_id, numericality: { other_than: 1 }

  has_one :purchase_history
  belongs_to :user
  has_one_attached :image


end