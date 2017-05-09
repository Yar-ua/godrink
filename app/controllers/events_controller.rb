class EventsController < ApplicationController

  # проверить залогинен ли юзер, исключение - просмотр существующих евентов
  before_action :authenticate_user!, except: [:show, :index]

  # задаем объект @event для экшена show
  before_action :set_event, only: [:show]

  # задаем объект @event для текущего пользователя
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  # задаем коллекцию камментов для партиала
  before_action :set_comments_event_collection, only: [:show]

  
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
  # заготовка модели для добавления формы комментария
  @new_comment = @event.comments.build(params[:comment])

  # Заготовка модели для формы подписки
  @new_subscription = @event.subscriptions.build(params[:subscription])

  # Заготовки для загрузки фото
  @new_photo = @event.photos.build(params[:photo])

  @gmap_show = GmapDot.last

  

  end


  # GET /events/1/edit
  def edit
  
  end

  
  # PATCH/PUT /events/1
  def update
  	if @event.update(event_params)
  	  redirect_to @event, notice: 'Информация о событии была обновлена'
  	else
  	  render 'edit'
  	end
  end


  # DELETE /events/1
  def destroy
  	@event.destroy
  	redirect_to events_path, notice: 'Событие было удалено'
  end



  protected

  def event_params
  	params.require(:event).permit(:title, :address, :datetime, :description) # , :pincode)
  end


  def set_event
  	@event = Event.find(params[:id])
  end


  def set_current_user_event
  	@event = current_user.events.find(params[:id])
  end

  # получаем коллекцию камментов для партиала
  def set_comments_event_collection
    @comments_event_collection = @event.comments.except(@new_comment).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end


end
