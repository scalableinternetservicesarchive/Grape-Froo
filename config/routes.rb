Rails.application.routes.draw do
  resources :memes
  devise_for :users
  resources :users, :only => [:show]
  resources :templates
  get "users/:id/memes" => 'users#memes', :as  => :user_memes
  get "users/:id/templates" => 'users#templates', :as => :user_templates
  get "templates/typeahead/:query" => 'templates#typeahead', :as => :typeahead
  root 'memes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
