Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }
    resources :users, only: [:show]

authenticated :user do
  root to: "users#show"
end
unauthenticated :user do    
  get "/" => "welcome#index"
end

end
