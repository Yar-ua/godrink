class GmapDot < ApplicationRecord

  # точки на карте принадлежат эвенту
  belongs_to :event

  # точки на карте принадлежат юзеру
  belongs_to :user

  # проверка на принадлежность эвенту и юзеру
  validates :event, presence: true
  validates :user, presence: true

  # проверка наличия широты и долготы
  validates :latitude, presence: true
  validates :longitude, presence: true

end
