class LessonsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @user = current_user
    @lesson = Lesson.new
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    redirect_to new_answer_url
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)
    if @lesson.save
      redirect_to new_category_lesson_answer_url(@category, @lesson, page:1)
    else
      render 'new'
    end
  end

  private
    def lesson_params
      params.require(:category_id).merge(user_id: current_user.id)
    end
end
