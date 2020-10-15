class Admin::UsersController < ApplicationController
  
  before_action :require_admin

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  private
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
