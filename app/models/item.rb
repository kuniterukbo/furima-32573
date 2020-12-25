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

    validates :user
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :product_state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
    validates :selling_price
  end
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  has_one :purchase_history
  belongs_to :user
  has_one_attached :image


end