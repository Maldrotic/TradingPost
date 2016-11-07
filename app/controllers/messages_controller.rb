class MessagesController < ApplicationController

  before_filter :authorize

  def new
    @post = Post.find_by_id(params[:post_id])

    if !@post
      flash[:unknown_post_id] = 'There is no post associated to that ID.'
      redirect_to '/posts'
    end
  end

  def create
    post = Post.find_by_id(params[:post_id])
    if !post
      flash[:unknown_post_id] = 'There is no post associated to that ID.'
      redirect_to '/messages'
    end

    message = Message.new(message_params)
    message.sender_id = @current_user.id
    message.receiver_id = post.user.id
    message.post_id = post.id

    if message.save
      redirect_to '/messages'
    elsif message.errors.any?
      message.errors.full_messages.each do |error|
        flash[error] = error
      end
      redirect_to '/messages'
    else
      redirect_to '/messages'
    end
  end

  def show_all
  end

  def show
    message_id = params[:id]
    @message = Message.find_by_id(message_id)
    if !@message
      flash[:unknown_message_id] = 'There is no message with that ID.'
      redirect_to '/messages'
    elsif @message.sender.id != @current_user.id and @message.receiver.id != @current_user.id
      flash[:no_permission_to_message] = 'You do not have permission to this message.'
      redirect_to '/messages'
    else
      @message.is_read = true
      @message.save
    end
  end

  private
    def message_params
      params.require(:message).permit(:text, :sender_id, :receiver_id, :post_id, :is_read)
    end
end
