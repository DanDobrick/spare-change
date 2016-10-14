Rails.application.routes.draw do

   root "plaid#create"
  # resources :users, only: [:new, :create, :show] do
  #   member do
  #     post "plaid" => "plaid#create"
  #   end
  # end

  post '/users/plaid' => 'plaid#create'


end
