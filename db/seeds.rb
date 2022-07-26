# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

us1 = User.create(name: 'steve', email: 'steve@beve.com', bio: 'dogs r kewl', location: 'denver')
pe1 = Pet.create(name: 'jeeve', sex: 'male', bio: 'woof', breed: 'beagle', weight: 19, age: 5, user_id: us1.id)
us2 = User.create(name: 'james', email: 'jam@beve.com', bio: 'dogs r nice', location: 'denver')
pe2 = Pet.create(name: 'cat', sex: 'male', bio: 'woof', breed: 'boxer', weight: 19, age: 5, user_id: us2.id)
us3 = User.create(name: 'jamark', email: 'jamark@beve.com', bio: 'dogs r kewl', location: 'denver')
pe3 = Pet.create(name: 'dog', sex: 'male', bio: 'woof', breed: 'chow', weight: 19, age: 5, user_id: us3.id)
us4 = User.create(name: 'dave', email: 'dave@beve.com', bio: 'dogs r kewl', location: 'denver')
pe4 = Pet.create(name: 'cave', sex: 'male', bio: 'woof', breed: 'beagle', weight: 19, age: 5, user_id: us4.id)
us5 = User.create(name: 'hat', email: 'hat@beve.com', bio: 'dogs r kewl', location: 'denver')
pe5 = Pet.create(name: 'arm', sex: 'male', bio: 'woof', breed: 'boxer', weight: 19, age: 5, user_id: us5.id)
