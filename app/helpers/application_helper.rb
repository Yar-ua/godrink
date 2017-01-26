module ApplicationHelper


  # хелпер для иконок font-awesome
  def fa_icon
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  # задаем аватар по умолчанию
  def user_avatar(user)
  	if user.avatar?
  	  user.avatar.url
  	else
  	  asset_path('avatar-default.jpg')
  	end
  end

	
end
