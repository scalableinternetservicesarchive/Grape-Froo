Rails.application.routes.draw do
  resources :memes
  devise_for :users
  resources :users, :only => [:show]
  resources :templates
  get "users/:id/memes" => 'users#memes', :as  => :user_memes
  get "users/:id/templates" => 'users#templates', :as => :user_templates
  root 'memes#index'
  post 'memes/:id/upvote' => 'memes#upvote', :as => 'upvote_meme'
  post 'memes/:id/downvote' => 'memes#downvote', :as => 'downvote_meme'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
