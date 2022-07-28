class UserSerializer
  include JSONAPI::Serializer
  attributes :name,
             :bio,
             :email,
             :auth_token,
             :location,
             :pets
end
