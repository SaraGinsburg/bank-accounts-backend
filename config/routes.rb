Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions
      resources :accounts
    end
  end
end

# to match fetch('http://localhost:3000/api/v1/transactions')
