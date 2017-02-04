Rails.application.routes.draw do

  match 'about', to: 'static_pages#about', via: [:get]

  # для гема devise
  devise_for :users
 
  root 'events#index'

  # ресурсы events
  resources :events do

    # вложенный ресурс comments
  	resources :comments, only: [:create, :destroy]
    # вложенный ресурс subscriptions
    resources :subscriptions, only: [:create, :destroy]
    # вложенный ресурс photos
    resources :photos, only: [:create, :destroy]

    post :show, on: :member

  end

  # ресурс users
  resources :users, only: [:show, :edit, :update]

end