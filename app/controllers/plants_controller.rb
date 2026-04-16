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
  if @plant.plant_info.blank?
    response = RubyLLM.chat
      .with_instructions("You are a plant expert. Be concise but informative.")
      .ask("For a #{@plant.name} plant, give me:
      1. Tips to take care of the plant (a paragraph)
      2. A 2-3 sentence history and background on this specific plant
      Use this exact format:
      🌿 About
      Write the history here.

      💧 Care Tips
      - Tip one
      - Tip two
      - Tip three")
      .content
    @plant.update(plant_info: response)
  end
    @plant_info = @plant.plant_info
  end
end
