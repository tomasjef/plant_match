class FavoritesController < ApplicationRecord
  before_action :authenticate_user! # Devise -> only logged-in users can favorite

  def index
    @favorites = current_user.favorites # Get only the logged-in user's favorites
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @favorite = Favorite.new(user: current_user, plant: @plant)

    if @favorite.save
      redirect_to favorites_path, notice: "#{@plant.name} added to favorites!"
    else
      redirect_to plant_path(@plant), alert: "Something went wrong."
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path, status: :see_other, notice: "Removed from favorites."
  end
end
