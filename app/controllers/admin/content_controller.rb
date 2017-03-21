class Admin::ContentController < ApplicationController
  # использовать слой admin_application.html.erb
  layout "admin_application"
  # перед работой контроллера аутентифицировать админа
  before_action :authenticate_admin!


  def index

  end


  def new
  	
  end
end
