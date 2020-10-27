class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    # if params[:back].present?
    #   render :new
    #   return
    # end
    if @category.save
      redirect_to new_admin_category_url(@category), notice: "Successfully saved"
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to new_admin_category_url(@category), notice: "Successfully saved"
    else
      render 'edit'
    end
  end

  def show
    @category = Category.find(params[:id])
    @words = @category.words.all
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url, notice: "Successfully all delete!"
  end

  def index
    @categories = Category.all
  end

  

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end

end
