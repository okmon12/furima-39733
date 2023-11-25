class Shipping < ApplicationRecord


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_address_form
  belongs_to :buyer
  validates :shipping_city, presence: true
  validates :shipping_street, presence: true
  validates :shipping_building, presence: true
  validates :shipping_phone, presence: true  
  validates :shipping_postal_code, presence: true
  validates :shipping_address_form_id, presence: true, numericality: { other_than: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
