Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
   root "donors#show"
  # resources :users, only: [:new, :create, :show] do
  #   member do
  #     post "plaid" => "plaid#create"
  #   end
  # end



end
