class PetSerializer
  include JSONAPI::Serializer
  attributes :name,
             :breed,
             :sex,
             :bio,
             :weight,
             :age,
             :user_id
end
