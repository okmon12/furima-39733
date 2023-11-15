require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_kana、last_kana、birsdate、が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it '生年月日が空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに英数字が含まれないと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混合で入力してください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード１２３'
        @user.valid?
        expect(@user.errors[:password]).to include('は半角英数字混合で入力してください')
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Smith'
        @user.valid?
        expect(@user.errors[:first_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'sonoko'
        @user.valid?
        expect(@user.errors[:last_name]).to include('は全角（漢字・ひらがな・カタカナ）で入力してください')
      end
      it '名（カナ）にカタカナ以外の文字（平仮名、漢字、英数字、記号）が含まれていると登録できない' do
        @user.last_kana = '山田', 'Smith', '123', 'ｱｲｳ', '山田123', '山田@Smith'
        @user.valid?
        expect(@user.errors[:last_kana]).to include('は全角（カタカナ）で入力してください')
      end
      it '姓（カナ）にカタカナ以外の文字（平仮名、漢字、英数字、記号）が含まれていると登録できない' do
        @user.first_kana = '山田', 'Smith', '123', 'ｱｲｳ', '山田123', '山田@Smith'
        @user.valid?
        expect(@user.errors[:first_kana]).to include('は全角（カタカナ）で入力してください')
      end
    end
  end
end
