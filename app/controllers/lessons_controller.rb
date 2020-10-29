class LessonsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @user = current_user
    @lesson = Lesson.new
    redirect_to new_answer_url
  end

  private
    def lesson_params
      params.require(:category_id).merge(user_id: current_user.id)
    end
end
