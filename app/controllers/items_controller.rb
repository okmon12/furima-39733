class ItemsController < ApplicationController
  def index
  end

  def new
    @product_conditions = ProductCondition.all
  end

  def edit
  end

  def show
  end
end
