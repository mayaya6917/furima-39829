FactoryBot.define do
  factory :user do
    nickname { Faker::Alphanumeric.alphanumeric(number: 8) }
    email { Faker::Internet.email }
    password { "1111aaaa" }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana {"カタカナ"}
    first_name_kana {"カタカナ"}
    birth_date { Date.new(1990, 1, 1) }

  end
end
