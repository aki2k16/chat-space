Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  get '/users/search', to: 'users#search'
  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
   resources :messages, only: [:index, :new, :create]
  end
end
