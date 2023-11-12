require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      # it 'firstnameが空では登録できない' do
      #   @user.first_name = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First_name can't be blank")
      # end
      # it 'lastnameが空では登録できない' do
      #   @user.last_name = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Last_name can't be blank")
      # end
      # it 'firstkanaが空では登録できない' do
      #   @user.first_kana = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First_kana can't be blank")
      # end
      # it 'lastkanaが空では登録できない' do
      #   @user.last_kana = ''  
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("Last_kana can't be blank")
        # it 'birsdateが空では登録できない' do
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
      # it 'passwordに英字が含まれないと登録できない' do
      #     @user.password = @user.email: "test@example", password: "123456", password_confirmation: "123456")  
      #     @user.valid?
      #     expect(@user.errors.password).to include("must contain at least one letter")
      #   end
   end
end
