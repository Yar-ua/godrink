Rails.application.routes.draw do

  # точка входа в режиме пользователя
  root 'events#index'

  # точка входа для админки
  get 'admin' => 'admins#index'

  # рут для страницы инфо
  get '/about' => 'static_pages#about'

  # для входа админов через гем devise
  devise_for :admins
  # используем ресурс admins для управления профилями самих же админов
  # except: :create фиксим проблемы при создании нового админа
  # при пост-запросе выбивает ошибку типа "уже выполнен вход в систему"
  resources :admins, except: :create #, :update]
  # определяем post-запрос для создания админа другим админом
  post 'create_admin' => 'admins#create', as: :create_admin
  patch 'update_admin/:id' => 'admins#update', as: :update_admin
  # patch 'update_admin' => 'admins#update', as: :update_admin
  # put '/admins/:id/edit' => 'admins#update'


  # используем пространство имен для админ панели
  # namespace :admin do
  #  resources :events
  # end
    
  # для гема devise
  devise_for :users
  resources :users, only: [:index, :show]

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