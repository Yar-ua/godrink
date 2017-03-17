class AdminsController < ApplicationController
  # назначаем другой слой со стилямиь для панели админа
  layout "admin_application"
  
  before_action :authenticate_admin!
  

  def index
  	@admins = Admin.all
  end


  def new

  end


end
