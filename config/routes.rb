Rails.application.routes.draw do

  root "users#show"
  resources :users, only: [:new, :create, :show] do
    collection do
      post "plaid" => "plaid#create"
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :charities, only: [:index]

  post 'charities/search/:keyword', to: 'charities#search', :as => "charities_search"


end
