class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_owner, only: [:edit]
 
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
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
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :origin_location_id, :shipping_address_form_id, :shipping_fee_id, :category_id,
                                 :price, :image, :product_description, :product_condition_id).merge(user_id: current_user.id)
  end

  def redirect_if_not_owner
    redirect_to root_path unless user_signed_in? && @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
