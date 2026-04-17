class MessagesController < ApplicationController

  def update
  @chat = Chat.find(params[:id])

  # Extract form data
  criteria = {
    indoor_outdoor: params[:content],
  }
end

  SYSTEM_PROMPT = <<~PROMPT
    You are a plant recommendation assistant.
    Use the user's questionnaire answers and the provided plant seed data to recommend the best matching plants.
    Only use supplied plants and attributes. Do not invent data.

   The user is looking for plants with the following criteria:
    - indoor_outdoor: #{criteria[:content]}

  PROMPT

def create
  @chat = current_user.chats.find(params[:chat_id])

  @message = Message.new(message_params)
  @message.chat = @chat
  @message.role = "user"

  if @message.save
    response = RubyLLM.chat.ask(prompt)

    @chat.messages.create!(
      role: "assistant",
      content: response.content
    )

    redirect_to chat_path(@chat)
  else
    render "chats/show"
  end
end




  # def create
  #   @chat = current_user.chats.find(params[:chat_id])
  #   @plant = @chat.plant
  #   @message = Message.new(message_params)
  #   @message.chat = @chat
  #   @message.role = "user"

  #   response = RubyLLM.chat(prompt: prompt)

  #   # Save the response to the chat
  #   @chat.update(response: response)

  #   redirect_to @chat

  #   # if @message.save
  #   #   ruby_llm_chat = RubyLLM.chat
  #   #   response = ruby_llm_chat.with_instructions(instructions).ask(@message.content)
  #   #   Message.create(role: "assistant", content: response.content, chat: @chat)

  #   #   @chat.generate_title_from_first_message

  #   #   redirect_to chat_path(@chat)
  #   # else
  #   #   render "chats/show", status: :unprocessable_entity
  #   # end
  # end

  private

  def plant_context
    "Here are the collection of our plants: #{@plant.content}."
  end

  def instructions
    [SYSTEM_PROMPT, plant_context, @plant.system_prompt].compact.join("\n\n")
  end

  def message_params
    params.require(:message).permit(:content)
  end
end

# class MessagesController < ApplicationController
#   SYSTEM_PROMPT = <<~PROMPT
#     You are plant specialist, a helpful AI assistant that recommends suitable plants based on a user's needs and preferences.

#     Ask short, clear questions one at a time and keep the conversation concise.

#     Use the following attributes when making recommendations:
#     - name
#     - growth_style
#     - size
#     - light_needs
#     - water_needs
#     - care_level
#     - growth_speed
#     - indoor_outdoor
#     - pet_safe
#     - air_purifying
#     - toxicity_level

#     Start by asking:
#     1. Where will it live? [ Indoor / Outdoor ]
#     2. How much light? [ Low / Bright indirect / Direct sun ]
#     3. Care level? [ Easy / Medium / Advanced ]

#     Then suggest suitable plants.
#   PROMPT
#   def create
#     @chat = current_user.chats.find(params[:chat_id])
#     @message = Message.new(message_params)
#     @message.chat = @chat
#     @message.role = "user"
#     if @message.save
#       ruby_llm_chat = RubyLLM.chat
#       response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
#       Message.create!(role: "assistant", content: response.content, chat: @chat)
#       redirect_to chat_path(@chat)
#     else
#       render "chats/show", status: :unprocessable_entity
#     end
#   end

#   private

#   def message_params
#     params.require(:message).permit(:content)
#   end
# end
