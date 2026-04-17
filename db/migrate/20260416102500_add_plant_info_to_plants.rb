class AddPlantInfoToPlants < ActiveRecord::Migration[8.1]
  def change
    add_column :plants, :plant_info, :text
  end
end
