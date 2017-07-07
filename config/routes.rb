Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do

      # goods
      resources :goods

      # categories
      resources :categories do
        resources :goods
      end

      # services
      resources :services

      # search
      resources :search

      # resource library
      resources :resource_libraries
      resources :resource_libraries do
        resources :resources
      end
      resources :resources do
        get :download, on: :member
      end

    end
  end
end
