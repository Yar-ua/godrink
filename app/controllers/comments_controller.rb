class CommentsController < ApplicationController

  # задаем эвент, к которому принадлежит коммент (родительский евент)
  before_action :set_event, only: [:create, :destroy]

  # задаем сам коммент, который надо удалить
  before_action :set_comment, only: [:destroy]

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user
    if @new_comment.save
      # уведомляем подписчиков о новом комментарии
      # notify_subscribers(@event, @new_comment)

      redirect_to @event, notice: 'Комментарий добавлен'
    else
      render 'event/show', alert: I18n.t('controllers.comments.error')
    end
  end


  def destroy
    message = {notice: 'Комментарий удален'}

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = {alert: I18n.t('controllers.comment.error')}
    end
    redirect_to @event, message
  end




  private


  def set_event
  	@event = Event.find(params[:event_id])
  end


  def set_comment
  	@comment = @event.comments.find(params[:id])
  end


  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end



end
