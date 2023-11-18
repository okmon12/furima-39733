FactoryBot.define do
  factory :item do
    product_name              { 'あああ' }
    product_description       { 'いいい' }
    category_id               { '6' }
    product_condition_id      { '2' }
    shipping_address_form_id  { '2' }
    origin_location_id        { '2' }
    shipping_fee_id           { '2' }
    price                     { '555' }
  end
end
