# require 'rails_helper'

# RSpec.describe Buyer, type: :model do
#   before do
#     @buyer = FactoryBot.build(:buyer)
#   end

#   context '内容に問題ない場合' do
#     it "tokenがあれば保存ができること" do
#       expect(@buyer).to be_valid
#     end
#   end

#   context '内容に問題がある場合' do
#    it "tokenが空では登録できないこと" do
#       @order.token = nil
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Token can't be blank")
#     end
#   end
# end