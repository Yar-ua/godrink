class GmapDotsController < ApplicationController
  # усианавливаем эвент, которому принадлежит точка
  before_action :set_event, only: [:create, :destroy]

  def create
  	@new_gmap_dot = @event.gmap_dots.build(gmap_dot_params)
  	# с помощью введенных в модели методов поучаем раздельные координаты широты и долготы
  	# это потребуется для последующей генерации JSONа для гугл карты на яваскрипте
  	@new_gmap_dot.lat = @new_gmap_dot.get_lat(@new_gmap_dot.coords)
  	@new_gmap_dot.lon = @new_gmap_dot.get_lon(@new_gmap_dot.coords)
  	
  	@new_gmap_dot.user = current_user
  	if @new_gmap_dot.save
  	  redirect_to @event, notice: 'Точка добавлена'
  	else
  	  redirect_to @event, notice: 'Точка не добавлена'
  	end
  end


  private

  def set_event
  	@event = Event.find(params[:event_id])
  end

  def gmap_dot_params
  	params.require(:gmap_dot).permit(:coords, :title, :html)
  end

end
