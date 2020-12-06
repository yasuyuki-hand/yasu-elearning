class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.feed.paginate(page: params[:page])
    end 
  end

  def about
  end

  def contact
  end
end
