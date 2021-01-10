Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [] do
  #  resources :accounts, only: [] do
  #    resources :credit_cards, only: [] do
  #      resources :transactions, only: [:index]
  #    end
  #  end
  # end

  get '/users/:user_id/accounts/:account_id/credit_cards/:credit_card_id/transactions', to: 'transactions#index'
  post '/users/:user_id/accounts/:account_id/credit_card/:credit_card_id/charge', to: 'transactions#charge'
end
