Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do

      # goods
      resources :goods, only: [:index]

      # categories
      resources :categories, only: [:index] do
        resources :goods
      end

      # services
      resources :services, only: [:index]

      # search
      resources :search, only: [:index]

      # resource library
      resources :resource_libraries, only: [:index] do
        resources :resources
      end

      # resources
      resources :resources, only: [:index] do
        get :download, on: :member
      end

      # feedback
      resources :feedbacks, only: [:index, :create] do
        get :toggle_resolved, on: :member
      end

    end
  end
end
