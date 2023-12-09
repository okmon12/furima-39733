require 'rails_helper'

RSpec.describe BuyerShipping, type: :model do
  describe '配送情報' do
    before do
      @user = FactoryBot.create(:user) 
      @item = FactoryBot.create(:item)
      @buyer_shipping = FactoryBot.build(:buyer_shipping, item_id: @item.id, user_id: @user.id) 
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_shipping).to be_valid
      end
      it 'shipping_buildingは空でも保存できること' do
        @buyer_shipping.shipping_building
        expect(@buyer_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buyer_shipping.token = nil
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_shipping.shipping_postal_code = ''
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include("Shipping postal code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでなければ保存できない' do
        @buyer_shipping.shipping_postal_code = '1234567'
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include('Shipping postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が未選択では保存できないこと' do
        @buyer_shipping.shipping_address_form_id = '1'
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include('Shipping address form must be other than 1')
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_shipping.shipping_city = ''
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include("Shipping city can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_shipping.shipping_street = ''
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include("Shipping street can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_shipping.shipping_phone = ''
        @buyer_shipping.valid?
        expect( @buyer_shipping.errors.full_messages).to include("Shipping phone can't be blank")
      end
      it '電話番号が10桁未満の場合は無効であること' do
        @buyer_shipping.shipping_phone = '123456789'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Shipping phone は10桁以上11桁以内で入力してください")
      end
      
      it '電話番号が11桁以上の場合は無効であること' do
        @buyer_shipping.shipping_phone = '123456789012'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Shipping phone は10桁以上11桁以内で入力してください")
      end
      
      it '電話番号が半角数値以外の場合は無効であること' do
        @buyer_shipping.shipping_phone = '090-1234-5678'
        @buyer_shipping.valid?
        expect(@buyer_shipping.errors.full_messages).to include("Shipping phone は10桁以上11桁以内で入力してください", "Shipping phone は半角数値で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buyer_shipping = FactoryBot.build(:buyer_shipping, user_id: nil)
        expect(@buyer_shipping).not_to be_valid
        expect(@buyer_shipping.errors[:user_id]).to include("can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buyer_shipping = FactoryBot.build(:buyer_shipping, item_id: nil)
        expect(@buyer_shipping).not_to be_valid
        expect(@buyer_shipping.errors[:item_id]).to include("can't be blank")
      end
    end
  end
end
