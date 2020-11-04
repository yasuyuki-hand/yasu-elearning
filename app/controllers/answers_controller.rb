class AnswersController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.paginate(page: params[:page], per_page: 1)
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = Lesson.find(params[:lesson_id])
    @word = Word.find(params[:word_id])
    @choice = Choice.find(params[:choice_id])
    @answers = @lesson.answers.build(answer_params)
    # If the lesson was not taken yet, it will go to IF
    if @lesson.save
      unless params[:page].empty?
        #if there are still pages left for answer
        redirect_to new_category_lesson_answer_url(@category,@lesson, page: params[:page])
      else
        #if there are no pages left/no more words left
        result = 0
        @lesson.answers.each do |answer|
          #Go to rusults page
          if answer.choice.correct_ans?
            result += 1
          end
          #You update the results here
          @lesson.update_attributes(:result => result, :is_completed => true)
          
        end
        redirect_to category_lesson_url(@category, @lesson) #redirects if page=>""
      end
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

