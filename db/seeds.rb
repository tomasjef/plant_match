# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
puts "Cleaning database..."

Plant.create!(
  name: "Monstera",
  growth_style: "climbing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true
)
puts "Monstera created"

Plant.create!(
  name: "Snake Plant",
  growth_style: "upright",
  light_needs: "low",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: true
)
puts "Snake Plant created"

Plant.create!(
  name: "String of Hearts",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: false
)
puts "String of Hearts created"

Plant.create!(
  name: "Bird of Paradise",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true
)
puts "Bird of Paradise created"

Plant.create!(
  name: "Hydrangea",
  growth_style: "compact",
  light_needs: "bright indirect",
  water_needs: "high",
  care_level: "medium",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: false
)
puts "Hydrangea created"

Plant.create!(
  name: "Clusia",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true
)
puts "Clusia created"

Plant.create!(
  name: "Tradescantia",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true
)
puts "Tradescantia created"

Plant.create!(
  name: "Ilex",
  growth_style: "bushy",
  light_needs: "direct sun",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "outdoor",
  pet_safe: false,
  air_purifying: true
)
puts "Ilex created"

Plant.create!(
  name: "Lavender",
  growth_style: "bushy",
  light_needs: "direct sun",
  water_needs: "low",
  care_level: "medium",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: true
)
puts "Lavender created"

Plant.create!(
  name: "Spider Plant",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: true,
  air_purifying: true
)
puts "Spider Plant created"

Plant.create!(
  name: "Calathea Orbifolia",
  growth_style: "bushy",
  light_needs: "low",
  water_needs: "moderate",
  care_level: "advanced",
  indoor_outdoor: "indoor",
  pet_safe: true,
  air_purifying: true
)
puts "Calathea Orbifolia created"

Plant.create!(
  name: "Begonia",
  growth_style: "bushy",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "medium",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: false
)
puts "Begonia created"

Plant.create!(
  name: "Super Dwarf Cavendish",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "high",
  care_level: "advanced",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: false
)
puts "Super Dwarf Cavendish created"

puts "Done!"
