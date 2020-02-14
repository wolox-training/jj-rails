Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only: %i[index show] do
    collection do
      get :detailed_book
    end
  end

  resources :rents, only: %i[index show create]
end
