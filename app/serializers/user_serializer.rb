class UserSerializer
  include JSONAPI::Serializer
  attributes :name,
             :bio,
             :email,
             :location,
             :pets,
             :id
end
