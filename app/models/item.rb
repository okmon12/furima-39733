class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :origin_location
  belongs_to :product_condition
  belongs_to :shipping_address_form
  belongs_to :shipping_fee



  validates :product_name,  presence: true,
  validates :product_description, presence: true, 
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :product_condition_id, numericality: { other_than: 1 }, presence: true
  validates :shipping_address_form_id, numericality: { other_than: 1 }, presence: true, 
  validates :origin_location_id, numericality: { other_than: 1 }, presence: true, 
  validates :shipping_fee_id, numericality: { other_than: 1 }, presence: true
  validates :price, presence: true
  
end
