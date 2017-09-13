Rails.application.routes.draw do
  root 'pages#index'
  
  get '/about', to: 'static_pages#about'
  # CRUD - CREATE, READ, UPDATE, DELETE
  resources :pages
end
