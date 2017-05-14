module GmapDotsHelper
  
  def cut_nil_gmap_dots(value)
    # обрезаем массив коллекции @event.gmap_dots, содержащий пустые объекты в конце (если они есть)
    @array_dots_for_js = []

    value.each do |a|
   
      if a.id != nil
        @array_dots_for_js << a
      end
    end
   
    return @array_dots_for_js
  end

end
