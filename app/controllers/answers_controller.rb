class AnswersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.paginate(page: params[:page], per_page: 1)
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @word = Word.find(params[:word_id])
    @choice = Choice.find(params[:choice_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Word created!"
      
    else
      flash[:danger] = "Something failed."
      
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.all
  end

  private
  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end

