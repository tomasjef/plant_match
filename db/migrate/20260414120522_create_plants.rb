class CreatePlants < ActiveRecord::Migration[8.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :growth_style
      t.string :light_needs
      t.string :water_needs
      t.string :care_level
      t.string :indoor_outdoor
      t.boolean :pet_safe
      t.boolean :air_purifying

      t.timestamps
    end
  end
end
