module ApplicationHelper


  # хелпер для иконок font-awesome
  def fa_icon
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  # задаем аватар по умолчанию. если юзер имеет аватару - то возвращаем ее
  # иначе - возвращаем стандартную аватару
  def user_avatar(user)
  	if user.avatar?
  	  user.avatar.url
  	else
  	  asset_path('avatar-default.jpg')
  	end
  end


  # Аналогично user_avatar, только возвращает миниатюрную версию
  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_path('avatar-default.jpg')
    end
  end


  # возвращает адрес случайной фотки события, если есть хотя бы одна фотка события
  # иначе возвращает ссылку на случайную картинку
  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('background_event.jpg')
    end
  end


  # возвращает мини-версию фотографии из евента для отображения на обложке
  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end

  end

	
end
