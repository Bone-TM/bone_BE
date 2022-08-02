Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      namespace 'users' do
        get '/find', controller: :user_find, action: :find
      end
      resources 'users' do
        resources 'pets', only: :create
      end
      resources 'pets', only: [:index, :show, :destroy, :update]
    end
  end
end
