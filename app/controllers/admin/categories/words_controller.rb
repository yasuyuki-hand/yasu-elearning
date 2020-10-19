class Admin::Categories::WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
