Rails.application.routes.draw do


  devise_for :users
  get 'users/show'

  get 'users/edit'

  # для гема devise
#  
  root 'events#index'

  # ресурсы events
  resources :events do

    # вложенный ресурс comments
#  	resources :comments, only: [:create, :destroy]
    # вложенный ресурс subscriptions
#    resources :subscriptions, only: [:create, :destroy]
    # вложенный ресурс photos
#    resources :photos, only: [:create, :destroy]

#    post :show, on: :member

  end

  # ресурс users
#  resources :users, only: [:show, :edit, :update]

end