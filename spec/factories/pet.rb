FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    breed { Faker::Creature::Dog.breed }
    sex { Faker::Creature::Dog.gender }
    bio { Faker::Movies::StarWars.quote(character: 'yoda') }
    weight { Faker::Number.number(digits: 2) }
    age { Faker::Creature::Dog.age }
  end
end
