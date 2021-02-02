Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  
  root 'articles#index'
  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments
  end
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]

  get 'articlecomments', to: 'comments#show'
end
