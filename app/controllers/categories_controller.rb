class CategoriesController < ApplicationController

  before_action :authorize

  def new
  end

  def create
    category = Category.new(category_params)

    if category.save
      redirect_to '/categories'
    elsif category.errors.any?
      category.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to '/categories/new'
    else
      redirect_to '/categories/new'
    end
  end

  def show
    @category = Category.find_by_id(params[:category_id])

    if !@category
      flash[:unknown_category_id] = 'There is no category with that id.'
      redirect_to '/categories'
    end
  end

  def show_all
    @categories = Category.all
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
