class Event < ApplicationRecord

  # событие принадлежит юзеру
  belongs_to :user

  # проверка, событие создает юзер. юзера не может не быть
  validates :user, presence: true
  # заголовок должен быть, и не длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # всегда должен быть адрес и время
  validates :address, presence: true
  validates :datetime, presence: true

end
