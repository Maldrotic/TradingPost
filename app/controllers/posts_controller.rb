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
    else 
      @posts = Post.all
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
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
      params.require(:post).permit(:title, :description, :image_url, :price, :user_id)
    end
  
end
