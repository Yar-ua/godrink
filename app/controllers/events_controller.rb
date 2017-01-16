class EventsController < ApplicationController

  # проверить залогинен ли юзер, исключение - просмотр существующих евентов
  before_action :authenticate_user!, except: [:show, :index]

  
  # GET /events
  def index
  	@event = Event.all
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




  protected

  def event_params
  	params.require(:event).permit(:title, :adress, :datetime, :description) # , :pincode)
  end


end
