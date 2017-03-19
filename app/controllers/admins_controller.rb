class AdminsController < ApplicationController
  # назначаем другой слой со стилямиь для панели админа
  layout "admin_application"
  
  before_action :authenticate_admin!
  before_action :admin_params, only: [:create]
  before_action :set_editing_admin, only: [:edit, :update, :destroy]
  before_action :admin_edit_params, only: :update

    

  # получаем перечень админов
  # get /admins
  def index
  	@admins = Admin.all
  end


  # создаем админа
  # get /admins/new
  def new
  	@admin = Admin.new
  end


  # сохраняем админа
  # post create_admin(.:format), см. переопределенный метод в роутинге
  # это фиксит проблемы создания другого пользователя, если уже выполнен вход в геме devise
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admins_path, notice: 'Профиль админа создан!'
    else
      redirect_to admins_path, alert: 'Ошибка создания профиля админа!'
    end
  end


  def edit


  end


  def update
    @admin.update(admin_edit_params)
    redirect_to admins_path
  end




  private

  # получаем данные формы админа
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  def set_editing_admin
    @admin = Admin.find(params[:id])
  end

  def admin_edit_params
    params.require(:admin).permit(:name, :email)
  end


end
