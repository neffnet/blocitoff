Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }
    resources :users, only: [:show]

    
  root to: "welcome#index"
end
