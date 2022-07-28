class UserSerializer
  include JSONAPI::Serializer
  attributes :name,
             :bio,
             :email,
             :password_digest,
             :location,
             :pets
end
