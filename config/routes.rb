Rails.application.routes.draw do
  resources :templates
  get 'static_pages/home'

  post '/templates/search', to: 'templates#search'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
