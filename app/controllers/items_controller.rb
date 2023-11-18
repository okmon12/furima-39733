class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @item = Item.new
  end

  def new
    @product_conditions = ProductCondition.all
    @item = Item.new
    
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # 保存成功時の処理
      redirect_to root_path
    else
     
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :origin_location_id, :shipping_address_form_id, :shipping_fee_id, :category_id, :price, :image, :product_description, :product_condition_id).merge(user_id: current_user.id)
  end
end
