class UsersController < ApplicationController
  before_action :only_loggedin_users, only: [:index, :edit, :update, :destroy, :following, :followers]

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

  def show
    @user = User.find(params[:id])

    #show all microposts of this user
    # @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end
  
end
