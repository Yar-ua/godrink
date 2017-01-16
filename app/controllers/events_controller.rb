class EventsController < ApplicationController

  # проверить залогинен ли юзер, исключение - просмотр существующих евентов
  before_action :authenticate_user!, except: [:show, :index]

  def index
  	@event = Event.all
  end

  def new
  end

  def create
  end
end
