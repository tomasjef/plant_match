class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show results]

  def index
    @plants = Plant.all
  end

  def results
    @plants = Plant.all
    score_plants
  end

  def show
    @plant = Plant.find(params[:id])

    if @plant.plant_info.blank?
      response = RubyLLM.chat
                        .with_instructions("You are a plant expert. Be concise but informative. Use <strong> tags for section titles.")
                        .ask("For a #{@plant.name} plant, give me:
        <strong>1. Care tips</strong>
        <strong>2. A short history of this plant</strong>
        <strong>3. A common illness for this plant and the method of treatment</strong>")
                        .content

      @plant.update(plant_info: response)
    end

    @plant_info = @plant.plant_info
  end

  private

  def score_plants
    scored_plants = @plants.map do |plant|
      score = 0
      score += 1 if plant.light_needs == params[:light_needs]
      score += 1 if plant.water_needs == params[:water_needs]
      score += 1 if plant.care_level == params[:care_level]
      score += 1 if plant.growth_style == params[:growth_style]
      score += 1 if plant.indoor_outdoor == params[:indoor_outdoor]
      score += 1 if plant.pet_safe == (params[:pet_safe] == "true")
      score += 1 if plant.air_purifying == (params[:air_purifying] == "true")
      { plant: plant, score: score }
    end

    @plants = scored_plants.sort_by { |item| -item[:score] }.first(3)
  end
end
