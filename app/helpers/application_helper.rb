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

	
end
