class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # настройка для работы девайза при правке профиля юзера
  before_action :configure_permitted_parameters, if: :devise_controller?

  # метод хелпера, доступный во вьюхах
  # юзер может редактировать событие если он его создал
  helper_method :current_user_can_edit?


  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
    
    devise_parameter_sanitizer.permit(:sign_up, 
    	keys: [:name, :email, :password, :password_confirmation])
    
  end


  def current_user_can_edit?(model)
    # если пользователь залогинен
  	user_signed_in? and 
  	  # если у модели есть юзер и он залогинен
  	  (model.user == current_user or
        # пробуем у модели взять эвент, и если он есть проверяем его юзера
        # совпадает ли текущий юзер с юзером модели (т е является создателем эвента)
  	  	(model.try(:event).present? and model.event.user == current_user))
  end

end
