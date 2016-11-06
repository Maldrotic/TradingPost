class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    user.image_url = ''
    if user.save
      session[:user_id] = user.id
      redirect_to '/posts'
    elsif user.errors.any?
      user.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to '/signup'
    else
      redirect_to '/signup'
    end
  end

  def show
    # Block this endpoint to users
    if !current_user
      redirect_to '/'
    end

    user_id = params[:user_id]
    @user = User.find_by_id(user_id)
    @posts = nil
    unless @user.nil?
      @posts = Post.find_by_user_id(user_id)
    else
      flash[:unknown_user_id] = "That is not a know user ID."
      redirect_to '/posts'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
