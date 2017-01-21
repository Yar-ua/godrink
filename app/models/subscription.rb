class Subscription < ApplicationRecord
  # модель подписки
  belongs_to :event
  belongs_to :user

  validates :event, presence: true

  # валидации выполняются если user не задан (незарегистрированные юзеры)
  validates :user_name, presence: true, unless: 'user.present?'
  #validates :user_email, presence: true, 
  #			format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: 'user.present?'

  # для данного event_id один юзер может подписаться только один раз
  validates :user, uniqueness: {scope: :event_id}, if: 'user.present?'

  # переопределяем метод, если есть юзер, выдаем его имя,
  # если нет -- дергаем исходный переопределенный метод
  def user_name
  	if user.present?
  	  user.name
  	else
  	  super
  	end
  end


  # переопределяем метод, если есть юзер, выдаем его email,
  # если нет -- дергаем исходный переопределенный метод
  def user_email
  	if user.present?
  	  user.email
  	else
  	  super
  	end
  end

end

