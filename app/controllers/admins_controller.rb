class AdminsController < ApplicationController
  # назначаем другой слой со стилямиь для панели админа
  layout "admin_application"
  
  before_action :authenticate_admin! #, only: [:index]
  before_action :admin_params, only: [:create]
  

  # получаем перечень админов
  def index
  	@admins = Admin.all
  end


  # создаем админа
  def new
  	@admin = Admin.new
  end

  # сохраняем админа
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_path, notice: 'all ok!'
    else
      redirect_to admins_path, alert: 'something wrong!'
    end
  end



  private

  # получаем данные формы админа
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end


end
