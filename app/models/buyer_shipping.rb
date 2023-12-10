class BuyerShipping
  include ActiveModel::Model
  attr_accessor :shipping_city, :shipping_street, :shipping_building, :shipping_phone, :shipping_postal_code, :shipping_address_form_id, :user_id, 
                 :item_id, :token
  
  with_options presence: true do 
    validates :shipping_city
    validates :shipping_street
    validates :shipping_phone, length: { in: 10..11, message: 'は10桁以上11桁以内で入力してください' }, numericality: { only_integer: true, message: 'は半角数値で入力してください' }
    validates :shipping_postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :token
    validates :shipping_address_form_id, numericality: { other_than: 1 }
  end
    

    def save 
    
      buyer = Buyer.create(item_id: item_id, user_id: user_id)
                      
      Shipping.create(shipping_address_form_id: shipping_address_form_id, shipping_postal_code: shipping_postal_code, shipping_city: shipping_city,
                      shipping_building: shipping_building, shipping_street: shipping_street, shipping_phone: shipping_phone, buyer_id: buyer.id)
                      
    end
end