require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
      context '出品がうまく行く時' do
        it "全ての情報が適切に入力されている時出品できる" do
          @item.valid?
        end
      end

      context '出品がうまくいかないとき' do
        it "商品画像を付けないと出品できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名が空だと出品できない" do
          @item.product_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end
        it "商品の説明が空だと出品できない" do
          @item.product_explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product explanation can't be blank")
        end
        it "カテゴリーの情報が空だと出品できない" do
          @item.category_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "商品の状態の情報が空だと出品できない" do
          @item.product_state_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Product state can't be blank")
        end
        it "配送料負担の情報が空だと出品できない" do
          @item.shipping_charge_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end
        it "配送元の地域の情報が空だと出品できない" do
          @item.prefecture_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "配送までの日数の情報が空だと出品できない" do
          @item.delivery_date_id = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank")
        end
        it "価格についての情報が空だと出品できない" do
          @item.selling_price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price can't be blank")
        end
        it "カテゴリーが1（--）の場合は出品できない" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "商品の状態の情報が1（--）の場合は出品できない" do
          @item.product_state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Product state can't be blank")
        end
        it "配送料負担の情報が1（--）の場合は出品できない" do
          @item.shipping_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
        end
        it "配送元の地域の情報が1（--）の場合は出品できない" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it "配送までの日数の情報が1（--）の場合は出品できない" do
          @item.delivery_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank")
        end
        it "価格が¥300未満では出品できない" do
          @item.selling_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is out of setting range")
        end
        it "価格が¥10,000,000以上たど出品できない" do
          @item.selling_price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is out of setting range")
        end
        it "価格が全角では出品できない" do
          @item.selling_price = "１０００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is out of setting range")
        end
        it "価格が文字では出品できない" do
          @item.selling_price = "aaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is out of setting range")
        end
      end
      
end  
