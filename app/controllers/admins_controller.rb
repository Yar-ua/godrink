class AdminsController < ApplicationController
  # назначаем другой слой со стилямиь для панели админа
  layout "admin_application"
  
  before_action :authenticate_admin!, only: [:index]
  

  # получаем перечень админов
  def index
  	@admins = Admin.all
  end


  # создаем админа
  def new
  	@admin = Admin.new
  end

  def create
    
    redirect_to admins_path, notice: 'all ok!'
  end


end
