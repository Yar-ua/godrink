class Event < ApplicationRecord

  # настраиваем сортировку для модели в rails_admin
  rails_admin do 
    list do
      sort_by :created_at
      field :title
      field :description
      field :address
      field :datetime
    end
  end

   
  # событие принадлежит юзеру
  belongs_to :user

  # событие имеет много комментариев и подписок
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  # событие имеет много фоток
  has_many :photos, dependent: :destroy

  # имеет несколько точек на карте (gmap_dots)
  has_many :gmap_dots

  # у события много подписчиков (объекты User), 
  # через таблицу subscriptions, по ключу user_id
  has_many :subscribers, through: :subscriptions, source: :user

  # проверка, событие создает юзер. юзера не может не быть
  validates :user, presence: true
  # заголовок должен быть, и не длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # всегда должен быть адрес и время
  validates :address, presence: true
  # пока закоммментировано datetime т к при создании эвента форма сама подставит текущую дату и время
  # а для rails_admin надо заставить работать форму даты/времени
  validates :datetime, presence: true


  # получаем список участников события
  # всех подписавшихся + организатора(создателя)
  def visitors
    (subscribers + [user]).uniq
  end

end
