Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  match 'about', to: 'static_pages#about', via: [:get]

  # для гема devise
  devise_for :users
  resources :users, only: [:index, :show]
 
  root 'events#index'

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