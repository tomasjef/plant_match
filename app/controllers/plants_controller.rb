class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])

    # I'm using the LLM to generate care tips and a short history for each plant
    # It makes one call and returns both sections together
    # The result goes into @plant_info which I display in the show view
    # response = RubyLLM.chat
    #   .with_instructions("You are a plant expert. Be concise.")
    #   .ask("For a #{@plant.name} plant, give me:
    #   1. Three short care tips
    #   2. A 2-3 sentence history and background
    #   Format it clearly with Care Tips and About sections.")
    #   .content
    # @plant_info = response
  end
end
