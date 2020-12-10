class CategoriesController < ApplicationController
  def index
    @lesson = Lesson.new
    @categories = Category.all
  end
end
