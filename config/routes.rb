Rails.application.routes.draw do

  get 'admins/index'

  # для входа админов через гем devise
  devise_for :admins
    resources :events
  namespace :admins do
    resources :events
  end

    
  # для гема devise
  devise_for :users
  resources :users, only: [:index, :show]
 
  root 'events#index'
  get '/about' => 'static_pages#about'

  # фикс для удаления фото: перенаправляем get запрос в метод destroy
  get '/events/:event_id/photos/:id' => 'photos#destroy'


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