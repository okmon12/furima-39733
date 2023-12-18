require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録ができる時' do
      it 'product_name,product_description,category_id,origin_location_id,product_condition_id,shipping_address_form_id,shipping_fee_id,price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録ができない時' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'product_descriptionが空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it 'origin_location_idが未選択では登録できない' do
        @item.origin_location_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送日は1以外の値にしてください')
      end
      it 'product_condition_idが未選択では登録できない' do
        @item.product_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it 'shipping_address_form_idが未選択では登録できない' do
        @item.shipping_address_form_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'shipping_fee_idが未選択では登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('送料は1以外の値にしてください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額を入力してください", "金額は数値で入力してください", "金額は不正な値です")
      end

      it '価格が300以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
      end

      it '価格が9,999,999以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
      end
      it '価格が全角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("を入力してください")
      end
    end
  end
end
