class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise 	:database_authenticatable, 
  			:registerable,
         	:recoverable, 
         	:rememberable, 
         	:validatable


  # юзер может создавать много событий
  has_many :events, dependent: :destroy

  # имя юзера должно быть, и не длиннее 30 букв
  validates :name, presence: true, length: {maximum: 30}

  # при создании нового юзера (метод create), 
  # перед валидацией объекта выполнить метод set_name
  before_validation :set_name, on: :create

  # после коммита обновить подписки
  after_commit :link_subscriptions, on: :create

  # Добавляем аплоадер аватарок, чтобы заработал carrierwave
  # mount_uploader :avatar, AvatarUploader

  private

  # задаем юзеру случайное имя, если оно пустое
  def set_name
    self.name = "алик-#{rand(777)}" if name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: email).update_all(user_id: id)
  end

end
