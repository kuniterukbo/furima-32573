class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user.id == @item.user.id || @item.purchase_history != nil
      redirect_to root_path
    end
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: purchase_shipping_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
