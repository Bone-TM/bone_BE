class UserSerializer
  include JSONAPI::Serializer
  attributes :name,
             :bio,
             :email,
             :location,
             :pets,
             :id

  def self.no_match(email)
    { data: {}, errors: "Could not find email that matched with #{email}" }
  end
end
