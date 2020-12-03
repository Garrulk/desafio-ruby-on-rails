Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  root to: "transactions#index"

  post "/transaction/import", to: "transactions#import"
  get "/transaction/balance", to: "transactions#balance"
end
