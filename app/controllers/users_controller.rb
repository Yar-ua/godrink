class UsersController < ApplicationController
  
  # перед действием проверяем аутентификацию юзера
  before_action :authenticate_user!, except: [:show]

  # задаем текущего юзера как объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]


  # GET /users/1/
  def show
  	@user = User.find(params[:id])
  end

  # GET /user/1/edit
  def edit
  end


  private

  def set_current_user
  	@user = current_user
  end

end
