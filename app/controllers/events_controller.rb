class EventsController < ApplicationController

  # проверить залогинен ли юзер, исключение - просмотр существующих евентов
  before_action :authenticate_user!, except: [:show, :index]

  # задаем объект @event для экшена show
  before_action :set_event, only: [:show]

  
  # GET /events
  def index
  	@events = Event.all
  end


  # GET /events/1
  def new
  	@event = current_user.events.build
  end


  # POST /evebts
  def create
  	@event = current_user.events.build(event_params)

  	if @event.save
  	  redirect_to @event, notice: 'Событие успешно создано'
  	else
  	  render :new
  	end
  end


  def show

  end




  protected

  def event_params
  	params.require(:event).permit(:title, :address, :datetime, :description) # , :pincode)
  end


  def set_event
  	@event = Event.find(params[:id])
  end


end
