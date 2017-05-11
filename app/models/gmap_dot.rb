class GmapDot < ApplicationRecord

  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true

  validates :lat, :lon, presence: true


  # описываем метод формы, в форме поле ввода координат называется :coords
  def coords
  	# получаем координаты из формы одной строкой'#{lan}, #{lon}'
  end

  # тут мы получаем из строки координат отдельно значения широты и долготы, 
  # для  последующей записи в БД
  def coords=value
  	ar = value.split(',')
  	self.lat = ar[0]
  	self.lon = ar[1]
  end


end
