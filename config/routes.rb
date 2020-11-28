Rails.application.routes.draw do
  resources :transactions
  root to: "transactions#index"

  get "/transaction/import", to: "transaction#import"
end
