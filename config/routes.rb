Rails.application.routes.draw do
  resources :transactions
  root to: "transactions#index"

  post "/transaction/import", to: "transactions#import"
end
