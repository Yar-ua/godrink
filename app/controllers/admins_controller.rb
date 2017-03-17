class AdminsController < ApplicationController
  # назначаем другой слой со стилямиь для панели админа
  layout "admin_application"
  
  before_action :authenticate_admin!
  

  # получаем перечень админов
  def index
  	@admins = Admin.all
  end


  # создаем админа
  def new
  	@admin = Admin.new
  end


end
