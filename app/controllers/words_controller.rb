class WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words.all
    # @words = Word.all
  end

  def show
  end

  def new
    # We will select a category
    # @category = Category.find(params[:category_id])
    # # Inside category, we will make a word
    # @word = @category.words.build
    # # Inside word, we will create 3 choices
    # 3.times {
    #   @word.choices.build
    # }
    @category = Category.find(params[:category_id])
    @words = @category.words.all
    # @words = Word.all
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    # 3.times {
    #   Choice.find(params[:id])
    # }
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    3.times {
      @choices = Choice.find(params[:id])
    }
    
    if @word.update_attributes(word_params)
      flash[:success] = "Word created!"
      redirect_to admin_category_url(@word.category_id)
    else
      flash[:danger] = "Something failed."
      redirect_to edit_admin_category_word_url(@word.category_id)
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Word created!"
      redirect_to new_admin_category_word_url(@category)
    else 
      flash[:danger] = "Something failed."
      redirect_to new_admin_category_word_url(@category)
    end
  end

  def destroy
    #@category = Category.find(params[:category_id])
    Word.find(params[:id]).destroy
    redirect_to admin_category_words_url, notice: "Successfully all delete!"
  end

  private
  def word_params
    params.require(:word).permit(:word, choices_attributes:[:id, :choices, :correct_ans])
  end
end
