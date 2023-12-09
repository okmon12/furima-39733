class BuyersController < ApplicationController
  def index 
    @items = Item.all
    @item_id = params[:item_id]
    @buyer = current_user
    @buyer_id = @buyer.id
    @buyer_shipping = BuyerShipping.new
  
   

  end

  def new

  end

  def create
  
  end
  def show
  end

  private
  
  def buyer_shipping_params
    params.require(:buyer_shipping).permit(:shipping_city, :shipping_street, :shipping_phone, :shipping_postal_code, :shipping_address_form_id, :shipping_building, 
                   :buyer_id, :commit).merge(user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = "sk_test_sk_test_b95042d54d914eb0af9d5bec"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(  
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end