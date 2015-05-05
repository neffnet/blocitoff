Rails.application.routes.draw do

  get 'items/create'

  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :users, only: [:show] do
  	resources :items, only: [:create]
  end

	authenticated :user do
  		root to: "users#show"
	end
	unauthenticated :user do    
  		get "/" => "welcome#index"
	end

end
