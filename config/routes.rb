Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts do
        resources :transactions
      end
    end
  end
end

# to match fetch('http://localhost:3000/api/v1/transactions')
