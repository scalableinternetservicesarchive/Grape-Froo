Rails.application.routes.draw do
  resources :comments
  resources :memes, :except => [:edit]
  devise_for :users
  resources :users, :only => [:show]
  resources :templates
  get "users/:id/memes" => 'users#memes', :as  => :user_memes
  get "users/:id/templates" => 'users#templates', :as => :user_templates
  root 'memes#index'
  post 'memes/:id/vote' => 'memes#vote', :as => 'vote'
  get 'random' => 'memes#random'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
