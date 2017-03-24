class Admin::ContentController < ApplicationController
  # использовать слой admin_application.html.erb
  layout "admin_application"
  # перед работой контроллера аутентифицировать админа
  before_action :authenticate_admin!


  def index
  	@events = Event.all.order(created_at: :desc)

  end

  def show
  	@event = Event.find(params[:id])
  	@comments_event_collection = @event.comments.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  	render 'events/show'
  end


  def new

  end
end
