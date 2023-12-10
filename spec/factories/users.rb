FactoryBot.define do
  factory :user do
    nickname { Faker::Alphanumeric.alphanumeric(number: 8) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + "1a" }
    password_confirmation { password }
    last_name { Faker::Japanese::Name.last_name }
    first_name { Faker::Japanese::Name.first_name }
    last_name_kana {"カタカナ"}
    first_name_kana {"カタカナ"}
    birth_date { Date.new(1990, 1, 1) }

  end
end
