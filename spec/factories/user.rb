FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    bio { Faker::ChuckNorris.fact }
    email { Faker::Internet.email }
    location { Faker::Address.city }
  end
end
