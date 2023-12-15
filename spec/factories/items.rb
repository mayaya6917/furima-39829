FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Alphanumeric.alphanumeric(number: 40) }
    info { Faker::Lorem.characters(number: 1000)[0..999]}
    price { Faker::Number.between(from: 300, to: 9999999)}
    category { Category.where.not(id: 1).sample }
    sales_status { SalesStatus.where.not(id: 1).sample }
    shopping_fee_status { ShoppingFeeStatus.where.not(id: 1).sample }
    prefecture { Prefecture.where.not(id: 1).sample }
    scheduled_delivery { ScheduledDelivery.where.not(id: 1).sample }
 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
