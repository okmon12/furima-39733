require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '商品登録ができる時' do
      it 'product_name,product_description,category_id,origin_location_id,product_condition_id,shipping_address_form_id,shipping_fee_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができない時' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'origin_location_idが空では登録できない' do
        @item.origin_location_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin location can't be blank", "Origin location is not a number")
      end
      it 'product_condition_idが空では登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank", "Product condition is not a number")
      end
      it 'shipping_address_form_idが空では登録できない' do
        @item.shipping_address_form_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping address form can't be blank", "Shipping address form is not a number")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300以下では登録できない' do
         @item.price = '299' 
         @item.valid?
         expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999以上では登録できない' do 
         @item.price = '10000000' 
         @item.valid?
         expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')  
      end
      it '価格が全角数字では登録できない' do 
        @item.price = '１０００' 
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')  
      end
    end
  end
end
