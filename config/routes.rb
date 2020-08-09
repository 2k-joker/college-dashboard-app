Rails.application.routes.draw do
  resources :students, except: [:destroy]
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  get 'about', to: 'pages#about'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#delete'
end
