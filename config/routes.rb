Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
   resources :messages, only: [:index, :new, :create] 
 end
end
