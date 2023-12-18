class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  has_one :buyer
  belongs_to :user
  def sold_out?
    buyer.present?
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :origin_location
  belongs_to :product_condition
  belongs_to :shipping_address_form
  belongs_to :shipping_fee
 
 

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_address_form_id, presence: true, numericality: { other_than: 1 }
  validates :origin_location_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                 numericality: {
                                greater_than_or_equal_to: 300,
                                less_than_or_equal_to: 9_999_999,
                                only_integer: true,
                                greater_than_or_equal_to_message: '300以上で入力してください',
                                less_than_or_equal_to_message: '9,999,999以下で入力してください'
                               },
                                format: { with: /\A[0-9]+\z/}
end
