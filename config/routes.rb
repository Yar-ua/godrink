Rails.application.routes.draw do
  # =====================================================================
  # тут определяем точки входа в систему
  # =====================================================================
  #
  # точка входа для неаутентифицированных пользователей
  # root 'events#index'
  # unauthenticated - это метод гема devise
  unauthenticated do
   root :to => 'events#index'
  end
  #
  # точка входа для админки
  get 'admin' => 'admins#index'
  #
  # рут для страницы инфо
  get '/about' => 'static_pages#about'
  #
  # точка входа для аутентифицированных как :admins
  # authenticated - метод гема devise
  authenticated do
    as :admins do
      root :to => 'admins#index'
    end
  end
  #
  #
  # точка входа для аутентифицированных как :user
  authenticated do 
    as :user do
      root :to => 'events#index'
    end
  end
  #
  # =====================================================================
  # тут определяем роутинг для :admins
  # =====================================================================
  # для входа админов через гем devise как админ
  devise_for :admins
  #
  resources :admins, except: [:create, :update]
  # определяем post-запрос для создания админа другим админом
  post 'create_admin' => 'admins#create', as: :create_admin
  # определяем patch-запрос для редактирования админа другим админом
  # это было необходимо чтобы создать моршрут с :id для редактирования админа
  patch 'update_admin/:id' => 'admins#update', as: :update_admin
  # это было необходимо чтобы создать моршрут с :id для удаления админа
  delete 'destroy_admin/:id' => 'admins#destroy', as: :destroy_admin



  # используем пространство имен для админ панели
  # namespace :admin do
  #  resources :events
  # end
    
  # =====================================================================
  # тут определяем роутинг для :users
  # =====================================================================
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