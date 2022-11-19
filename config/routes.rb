Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destory'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :session, only:[:new, :create, :destroy]


  resources :users, only: [:new, :create, :edit, :update]


  resources :ideas do 
    resources :reviews, only: [:create, :destroy]

    resources :likes, shallow: true,  only: [:create, :destroy]

    get :liked, on: :collection

end

root "ideas#index"

resources :likes, shallow: true, only: [:create, :destroy]

end
