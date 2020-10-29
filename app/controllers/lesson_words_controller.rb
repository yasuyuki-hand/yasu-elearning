class LessonWordsController < ApplicationController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @lesson_words = @lesson.lesson_words.all
  end
end
