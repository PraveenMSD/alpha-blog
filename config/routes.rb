Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations", sessions: "devise/sessions#new" }

  root 'articles#index'
  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments
  end


  #LIKES
  #resource :likes
  # get '/users/likes', to: 'like#find_likes', as: 'likes'
  # put '/article/:id/likes', to: 'likes#like', as: 'likess'
  # delete '/article/:id/likes', to: 'likes#un_like', as: 'remove_like'

  post '/articles/get_count' => 'articles#get_count'

  


  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]

end
