class FavoritesController < ApplicationController
  # Nur eingeloggte User dürfen Pflanzen speichern
  before_action :authenticate_user!

  # User Story 4: Liste meiner Favoriten ("My Garden")
  def index
    @favorites = current_user.favorites
  end

  # User Story 3: Pflanze speichern
  def create
    @plant = Plant.find(params[:plant_id])
    # Wir erstellen die Verknüpfung
    @favorite = Favorite.new(user: current_user, plant: @plant)

    if @favorite.save
      redirect_to plants_path, notice: "#{@plant.name} added to your favorites! 🌱"
    else
      # Falls der User die Pflanze schon hat (Validierung), zurück zum Index
      redirect_to plants_path, alert: "Already in your favorites."
    end
  end

  # Bonus: Favorit entfernen
  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path, status: :see_other, notice: "Removed from favorites."
  end
end
