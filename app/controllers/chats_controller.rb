class ChatsController < ApplicationController
  def create
    @chat = Chat.new
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = current_user.chats
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find_or_create_by(user: current_user)
    @message = Message.new
  end
end
