class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :redirect_if_not_owner, only: [:edit]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:product_name, :origin_location_id, :shipping_address_form_id, :shipping_fee_id, :category_id,
                                 :price, :image, :product_description, :product_condition_id).merge(user_id: current_user.id)
  end
  
  def redirect_if_not_owner
    item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && item.user_id == current_user.id
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
