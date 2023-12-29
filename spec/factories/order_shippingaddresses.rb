FactoryBot.define do
  factory :order_shipping_address do
    post_code { '123-4567' }
    city { '石川市' }
    adresses { '石川' }
    phone_number { '0' + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    prefecture_id { 5 }
    building { '1-1' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
