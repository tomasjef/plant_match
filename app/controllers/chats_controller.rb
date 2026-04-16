class ChatsController < ApplicationController
  def create
    # @plant = Plant.find(params[:plant_id])

    @chat = Chat.new(title: Chat::DEFAULT_TITLE)
    # @chat.plant = @plant
    @chat.user = current_user

    if @chat.save
      redirect_to chat_path(@chat)
    else
      @chats = current_user.chats # to-check
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chat = Chat.find_or_create_by(user: current_user)
    @message = Message.new
  end
end


# class ChatsController < ApplicationController
#   def create
#     @plant = plant.find(params[:plant_id])

#     @chat = Chat.new(title: Chat::DEFAULT_TITLE)
#     @chat.plant = @plant
#     @chat.user = current_user

#     if @chat.save
#       redirect_to chat_path(@chat)
#     else
#       @chats = @plant.chats.where(user: current_user)
#       render "plants/show"
#     end
#   end

#   def show
#     @chat    = current_user.chats.find(params[:id])
#     @message = Message.new
#   end
# end
