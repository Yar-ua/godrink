class PhotosController < ApplicationController
  # для каждого действия надо получить событие, к которому привязана данная фотография
  before_action :set_event, only: [:create, :destroy]

  # для каждого действия destroy надо получить саму фотографию из БД
  before_action :set_photo, only: [:destroy]



  # действие для загрузки фото
  # на данном этапе фото может загружать даже незарегистрированный юзер
  def create
  	# создаем фотографию у нужного события
    @new_photo = @event.photos.build(photo_params)

  	# проставляем у фотографии пользователя
  	@new_photo.user = current_user

  	if @new_photo.save
  	  redirect_to @event, notice: 'Фото загружено'
  	else
  	  # render 'events/show', alert: I18n.t('controllers.photos.error')
      redirect_to event_path(@event), alert: 'Фото не загружено'
  	end
  end


  # действие удаления фотографии
  def destroy
    message = {notice: 'фото удалено'}

    # проерка - может ли юзер удалить фото
    # если может - удаляем, если нет - меняем сообщение
    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = {alert: 'по каким то причинам фото не удалено'}
    end

    redirect_to @event, message
  end



  private

  # т к фотка - вложенный ресурс то евент надо искать по id 
  # соответствующему event_id фотографии
  def set_event
  	@event = Event.find(params[:event_id])
  end


  def set_photo
  	@photo = @event.photos.find(params[:id])
  end


  # получаем массив паарметров photo
  # с единственным полем photo
  def photo_params
  	params.fetch(:photo, {}).permit(:photo)
  end

end
