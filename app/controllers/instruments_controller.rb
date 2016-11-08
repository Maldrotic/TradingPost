class InstrumentsController < ApplicationController

  before_action :authorize

  def new
    @category = Category.find_by_id(params[:category_id])
    if !@category
      flash[:unknown_category_id] = 'There is not a category with that ID.'
      redirect_to '/categories'
    end
  end

  def create
    category = Category.find_by_id(params[:category_id])
    if !category
      flash[:unknown_category_id] = 'There is not a category with that ID.'
      redirect_to '/categories'
    else
      instrument = category.instruments.new(instrument_params)

      if instrument.save
        redirect_to '/categories'
      elsif instrument.errors.any?
        post.errors.full_messages.each do |error|
          flash[error] = error
        end
        redirect_to '/categories/${params[:category_id]}/instruments/new'
      else
        redirect_to '/categories'
      end
    end
  end

  def show_all
    @instrument = Instrument.all
  end

  private
    def instrument_params
      params.require(:instrument).permit(:name, :category_id)
    end

end
