class Subscription < ApplicationRecord
  # модель подписки
  belongs_to :event
  belongs_to :user


end
