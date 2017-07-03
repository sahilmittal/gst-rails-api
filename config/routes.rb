Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :goods
      resources :categories do
        resources :goods
      end
      resources :services
    end
  end
end
