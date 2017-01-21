class SubscriptionsController < ApplicationController
  # задание родительского эвента для подписки
  before_action :set_event, only: [:create, :destroy]

  # задаем подписку, которую юзер хочет удалить
  before_action :set_subscription, only: [:destroy]








  private

  def set_subscription
  	@subscription = @event.subscriptions.find(params[:id])
  end


  def set_event
  	@event = Event.find(params[:event_id])
  end

  def subscription_params
  	# .fetch разрешает в params отсутствие ключа :subscription
  	# это будет использоваться если в дальнейшем сделаю рассылку подписок на email
  	# это нужно для подписки незалогиненных и незарегистрированных юзеров
  	params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end


end
