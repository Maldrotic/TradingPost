class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def unread_message_count
    return Message.where(post_user_id: @current_user.id, is_read: false)
  end
  helper_method :unread_message_count

end
