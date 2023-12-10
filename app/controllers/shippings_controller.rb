class ShippingsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buyer_shipping = BuyerShipping.new   
    @buyer = current_user
    @buyer_id = @buyer.id
    @item = Item.find(params[:item_id])
    if current_user == @item.user || @item.sold_out?
      redirect_to root_path
    end
  end

  def create    
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyerShipping.new(buyer_shipping_params)
    @buyer = current_user
    @buyer_id = @buyer.id
    if @buyer_shipping.valid?
      @buyer_shipping.save 
      pay_item
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
  private
  
  def buyer_shipping_params
    item_id = params[:item_id]
    params.require(:buyer_shipping).permit(:shipping_city, :shipping_street, :shipping_phone, :shipping_postal_code, :shipping_address_form_id, :shipping_building 
            ).merge(user_id: current_user.id, item_id: item_id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(@buyer_shipping.item_id)
      Payjp::Charge.create(
        amount: item.price,
        card: @buyer_shipping.token,    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end