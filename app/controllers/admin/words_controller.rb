class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @words = @category.words.all
  end

  def show
  end

  def new
    # We will select a category
    @category = Category.find(params[:category_id])
    # Inside category, we will make a word
    @word = @category.words.build
    # Inside word, we will create 3 choices
    3.times {
      @word.choices.build
    }
  end

  def edit
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      redirect_to new_admin_category_word_url(@category), notice: "Successfully saved"
    else 
      render 'new'
    end
  end

  private
  def word_params
    params.require(:word).permit(:word, choices_attributes:[:choices, :correct_ans])
  end
end
