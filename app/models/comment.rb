class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :event, presence: true
  validates :body, presence: true

  # поле должно быть только если не выполняется user.present?
  # т е у объекта не задан юзер
  validates :user_name, presence: true, unless: 'user.present?'

  # переопределяем метод, если есть юзер то выдаем его имя
  # если нет - то выполняем исходный переопределенный метод
  def user_name
  	if user.present?
  	  user.name
  	else
  	  super
  	end
  end
end
