class Admin::Categories::WordsController < ApplicationController
  def index
    @words = @category.words.all
  end

  def show
  end

  def new
    @word = Word.new
  end

  def create
    # if params[:word][:choices] == '1' ? word()
    
    # params[:choices].each do | di1,di2 |

    #   # チェックボックスにチェックがついている場合
    #   if di2 == "1"
    #     # DBのtitleカラムにタイトルを格納し保存
    #    correct = di2
    #   end
    # end 
    @word = Word.new(word_params)
    if @word.save
      redirect_to new_admin_categories_word_url(@word), notice: "Successfully saved"
    else
      render 'new'
    end
  end

  def edit
  end


  private
  def word_params
    # params[:choices].each do |di1, di2|
    #   if di2 == "1"
    #     answer = di2
    #   end
    # end
    params.require(:word).permit(:word, :id[])
  end
end
