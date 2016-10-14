Rails.application.routes.draw do
  root to: "donors#home"
  # resources :users, only: [:new, :create, :show] do
  #   member do
  #     post "plaid" => "plaid#create"
  #   end
  # end

  post '/users/plaid' => 'plaid#create'


end
