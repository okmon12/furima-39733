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
      # it 'first_nameが空では登録できない' do
      #   @user.first_name = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First_name can't be blank")
      # end
      # it 'last_nameが空では登録できない' do
      #   @user.last_name = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Last_name can't be blank")
      # end
      # it 'first_kanaが空では登録できない' do
      #   @user.first_kana = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First_kana can't be blank")
      # end
      # it 'last_kanaが空では登録できない' do
      #   @user.last_kana = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Last_kana can't be blank")
        # it 'birs_dateが空では登録できない' do
        #   @user.birthdate = ''  
        #   @user.valid?
        #   expect(@user.errors.full_messages).to include("Birthdate can't be blank")
        # end
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
        @user.password = "123456"
           @user.valid?
           expect(@user.errors[:password]).to include("は半角英数字混合で入力してください")
      end
      # it 'first_nameが全角ひらがな、カタカナ、漢字でなければ登録できない' do
      #   invalid_first_names = ['abc123', '123', 'abc', 'アイウ', 'ｱｲｳ']
      #   invalid_first_names.each do |invalid_first_name|
      #     @user.first_name = invalid_first_name
      #     puts "DEBUG: First Name: #{@user.first_name}"
      #     @user.valid?
      #     expect(@user.errors[:first_name]).to include("/は全角（漢字・ひらがな・カタカナ）で入力してください")
      # end
      # end
    end
  end
end 
