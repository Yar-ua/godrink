class SubscriptionsController < ApplicationController
  # задание родительского эвента для подписки
  before_action :set_event, only: [:create, :destroy]

  # задаем подписку, которую юзер хочет удалить
  before_action :set_subscription, only: [:destroy]



  def create
  	# заготовка для новой подписки
  	@new_subscription = @event.subscriptions.build(subscription_params)
  	@new_subscription.user = current_user

  	if @new_subscription.save
  	  # отправка письма автору события
  	  # EventMailer.subscription(@event, @new_subscription).deliver_now
  	  # если сохранено успешно то редирект на страницу евента
  	  redirect_to @event, notice: 'Вы пойдете, подписка создана'
  	else
      # если есть ошибки то рендерим шаблон события и алерт ошибок
      render 'events/show', alert: I18n.t('controllers.subscription.error')
  	end
  end


  def destroy
    
  	  if current_user_can_edit?(@subscription)
  	  	@subscription.destroy
  	  	message = {notice: 'Решение изенено, подписка удалена'}
  	  else
  	  	message = {alert: 'Ты не можешь решать за других!'}
  	  end

  	redirect_to @event, message
  end


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
