FactoryBot.define do
  factory :buyer_shipping do
      shipping_postal_code { '123-4567' }
      shipping_address_form_id {'6' }
      shipping_city { '大川市' }
      shipping_street { '1-1' }
      shipping_building { '東京ハイツ' }
      shipping_phone { '09012345678' }
      token {"tok_abcdefghijk00000000000000000"}
  end
end