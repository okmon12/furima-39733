class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,  presence: true, allow_blank: false, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :nickname, presence: true
  validates :birthdate, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください" }
  validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）で入力してください" }
  # app/models/user.rb
  
  #attribute :name, :string

  # has_many :items
  # has_many :buyers
end
