class GuestSessionsController < ApplicationController
  # skip_before_action :login_required

  def create
    user = User.find_by(email: 'test@email.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to root_path(user)
  end
end
