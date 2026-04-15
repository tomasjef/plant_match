class MessagesController < ApplicationController
  before_action :build_chat
  SYSTEM_PROMPT = <<~PROMPT
    You are plant specialist, a helpful AI assistant that recommends suitable plants based on a user's needs and preferences.

    Ask short, clear questions one at a time and keep the conversation concise.

    Use the following attributes when making recommendations:
    - name
    - growth_style
    - size
    - light_needs
    - water_needs
    - care_level
    - growth_speed
    - indoor_outdoor
    - pet_safe
    - air_purifying
    - toxicity_level

    Start by asking:
    1. Where will it live? [ Indoor / Outdoor ]
    2. How much light? [ Low / Bright indirect / Direct sun ]
    3. Care level? [ Easy / Medium / Advanced ]

    Then suggest suitable plants.
  PROMPT

  def create
    @chat = current_user.chats.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      Message.create!(role: "assistant", content: response.content, chat: @chat)

      redirect_to chat_path(@chat)

    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
