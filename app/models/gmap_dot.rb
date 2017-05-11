class GmapDot < ApplicationRecord

  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true

  validates :coords, :lat, :lon, presence: true

  # добавляем методы объектов - получение широты из параметра класса :coords
  def get_lat(value)
  	mass_coord = value.split(',')
  	@lat = mass_coord[0]
  end

  # добавляем методы объектов - получение долготы из параметра класса :coords
  def get_lon(value)
  	mass_coord = value.split(',')
  	@lat = mass_coord[1]
  end


end
