class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index, :edit, :update, :destroy, :following, :followers]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user # show page
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
    @user = User.find(params[:id])
    @activities = @user.activities.paginate(page: params[:page])
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 10)
    @all_users = @user.followed_users

    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    @all_users = @user.followers
    render 'show_follow'
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
  
end
