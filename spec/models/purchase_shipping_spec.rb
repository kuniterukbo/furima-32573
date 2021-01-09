require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @purchase_shipping = FactoryBot.build(:purchase_shipping)
  end
  context '商品の購入が出来る' do
    it "必要な情報を適切に入力すると、商品の購入ができる" do
      @purchase_shipping.valid?
    end
    it "建物名が抜けていても購入ができる" do
      @purchase_shipping.building_name = ""
      @purchase_shipping.valid?
    end
  end

  context '商品の購入ができない時' do
    it "郵便番号の情報が空だと購入できない"do
      @purchase_shipping.postal_code = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
    end
    it "都道府県の情報が空だと購入できない"do
      @purchase_shipping.prefecture_id = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "都道府県の情報が1(--)だと購入できない"do
      @purchase_shipping.prefecture_id = 1
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村の情報が空だと購入できない"do
      @purchase_shipping.municipality = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it "番地の情報が空だと購入できない"do
      @purchase_shipping.address = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号の情報が空だと購入できない"do
      @purchase_shipping.phone_number = ""
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it "郵便番号にハイフンがないと購入できない"do
      @purchase_shipping.postal_code = "1234567"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "電話番号にハイフンがあると購入できない"do
      @purchase_shipping.phone_number = "090-1234-5678"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が12桁以上だと購入できない"do
      @purchase_shipping.phone_number = "090123456789"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it "電話番号が英数混合だと登録できない" do
      @purchase_shipping.phone_number = "0901234abcd"
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では登録できない" do
      @purchase_shipping.token = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空だと購入できない" do
      @purchase_shipping.user_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空だと購入できない" do
      @purchase_shipping.item_id = nil
      @purchase_shipping.valid?
      expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end
  end
end
