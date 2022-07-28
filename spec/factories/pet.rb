FactoryBot.define do
<<<<<<< HEAD
    factory :pet do
      name { Faker::Creature::Dog.name }
      breed { Faker::Creature::Dog.breed }
      sex { Faker::Faker::Creature::Dog.gender }
      bio { Faker::Movies::StarWars.quote(character: "yoda") }
      weight { Faker::Number.number(digits: 2) }
      age { Faker::Creature::Dog.age }

    end
=======
  factory :pet do
    name { Faker::Creature::Dog.name }
    breed { Faker::Creature::Dog.breed }
    sex { Faker::Creature::Dog.gender }
    bio { Faker::Movies::StarWars.quote(character: 'yoda') }
    weight { Faker::Number.number(digits: 2) }
    age { Faker::Creature::Dog.age }
  end
>>>>>>> 912563b39e03f05f77c6ea124ca8d102f37cad00
end
