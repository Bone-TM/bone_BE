FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    bio { Faker::ChuckNorris.fact }
    email { Faker::Internet.email }
    auth_token { Faker::Crypto.sha1 }
    location { Faker::Address.city }
  end
end
