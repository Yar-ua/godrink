class UsersController < ApplicationController
  
  # перед действием проверяем аутентификацию юзера
  before_action :authenticate_user!, except: [:show]

  # задаем текущего юзера как объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]


  # GET /events
  def index
    # @comments_event_collection = @event.comments.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @events = Event.all
    @users = User.all.paginate(page: params[:page], per_page: 2)
  end


  # GET /users/1/
  def show
  	@user = User.find(params[:id])
    @comment = @user.comments.order(created_at: :desc).limit(5)
  end

  # GET /user/1/edit
  def edit
  end


  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Профиль обновлен'
    else
      render 'edit'
    end
  end


  private

  def set_current_user
  	@user = current_user
  end


  # пользователь в этом контроллере может менять имя, емейл
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

end
