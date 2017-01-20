class CommentsController < ApplicationController

  # задаем эвент, к которому принадлежит коммент (родительский евент)
  before_action :set_event, only: [:create, :destroy]

  # задаем сам коммент, который надо удалить
  before_action :set_comment, only: [:destroy]

  def create
  end


  def destroy
  end




  private


  def set_event
  	@event = Event.find(params[:event_id])
  end


  def set_comment
  	@comment = @event.comments.find(params[:id])
  end



end
