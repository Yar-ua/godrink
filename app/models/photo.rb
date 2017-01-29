class Photo < ApplicationRecord

  # фото принадлежит какому то событию
  belongs_to :event

  # фото загрузил какой то юзер
  # связь выключена, если юзера удалить то фото должно все равно остаться
  # belongs_to :user

  # у фотографии всегда есть юзер и эвент
  validates :user, presence: true
  validates :event, presence: true

  # Добавляем аплоадер фотографий, чтобы заработал carrierwave
  mount_uploader :photo, PhotoUploader

  # этот scope нужен чтобы отделить реальные фото от болванной фотки
  # см. events_controller
  scope :persisted, -> { where 'id IS NOT NULL' }

end
