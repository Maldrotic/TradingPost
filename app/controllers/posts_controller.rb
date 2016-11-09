class PostsController < ApplicationController

  before_action :authorize

  def show_all
    if params[:user_id]
      user_id = params[:user_id]
      @user = User.find_by_id(user_id)
      if !@user
        flash[:unknown_user_id] = 'There is no user with that ID.'
        redirect_to '/posts'
      end
      @posts = Post.where(user_id: user_id)
      if !@posts
        flash[:no_posts_for_user] = 'This user has no posts.'
        redirect_to '/posts'
      end
    elsif params[:instrument_id] != "" and params[:instrument_id].to_i > 0
      instrument_id = params[:instrument_id]
      @instrument = Instrument.find_by_id(instrument_id)

      if @instrument.nil?
        flash[:unknown_instrument_id] = 'There is no instrument with that id.'
        redirect_to '/posts/search'
        return
      else
        @posts = @instrument.posts
      end
    else
      @posts = Post.all
    end

    if !params[:q].blank?
      @query = params[:q]
      @posts = @posts.where('title like ?', "%#{@query}%")
    end

    if params[:price_min] != "" and params[:price_min].to_i > 0
      @price_min = params[:price_min].to_i
    end
    if params[:price_max] != "" and params[:price_max].to_i > 0
      @price_max = params[:price_max].to_i
    end
    if @price_min and @price_max
      if @price_min > @price_max
        flash[:incorrect_prices] = 'The maximum price must be greater than or equal to the minimum price.'
        redirect_to '/posts/search'
      else
        @posts = @posts.where(price: @price_min..@price_max)
      end
    elsif @price_min
      if @price_min < 1
        flash[:incorrect_min_price] = 'The minimum price must be greater than 0.'
        redirect_to '/posts/search'
      else
        @posts = @posts.where('price >= ?', @price_min)
      end
    elsif @price_max
      if @price_max < 1
        flash[:incorrect_max_price] = 'The maximum price must be greater than 0.'
        redirect_to '/posts/search'
      else 
        @posts = @posts.where('price <= ?', @price_max)
      end
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @categories = Category.all
  end

  def search
    @categories = Category.all
  end

  def show_posts_for_instrument
    instrument_id = params[:instrument_id]
    @instrument = Instrument.find_by_id(instrument_id)

    if !@instrument
      flash[:unknown_instrument_id] = 'There is no instrument with that id.'
      redirect_to '/posts'
    else
      @posts = @instrument.posts
      render "show_all"
    end
  end

  def create
    post = @current_user.posts.new(post_params)

    if post.save
      redirect_to '/posts/show/'+post.id.to_s
    elsif post.errors.any?
      post.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to '/posts/new'
    else
      redirect_to '/posts'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :instrument_id, :description, :image_url, :price, :user_id)
    end
  
end
