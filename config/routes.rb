Rails.application.routes.draw do
  root "application#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :charities, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get 'history' => 'users#donation_history'
    end
    collection do
      post "plaid" => "plaid#create"
    end
  end

  get '/about' => 'application#about'

  post 'charities/search/:keyword', to: 'charities#search', :as => "charities_search"

  put 'users/charity/update', to: 'users#charity_update'

  put 'users/charity/pause', to: 'users#charity_pause'

end
