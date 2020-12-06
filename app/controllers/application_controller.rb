class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end

  private
  def check_admin_user
    unless logged_in? && current_user.admin?
      flash[:danger] = "You cannot access this page!"
      redirect_to(root_url)
    end
  end
end
