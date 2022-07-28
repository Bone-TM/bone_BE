Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources 'users', only: %i[index create] do
        resources 'pets', only: :index
      end
    end
  end
end
