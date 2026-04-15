puts "Cleaning database..."
# WICHTIG: Zuerst Favorites löschen, da sie auf Pflanzen verweisen
Favorite.destroy_all if defined?(Favorite)
Plant.destroy_all

puts "Creating plants..."

Plant.create!(
  name: "Monstera",
  growth_style: "climbing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252715/monstera_hydor6.avif"
)

Plant.create!(
  name: "Snake Plant",
  growth_style: "upright",
  light_needs: "low",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252716/snake_plant_qibedh.avif"
)

Plant.create!(
  name: "String of Hearts",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: false,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252716/string_of_hearts_f8wxzi.avif"
)

Plant.create!(
  name: "Bird of Paradise",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "low",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252714/bird_of_paradise_xnpbml.avif"
)

Plant.create!(
  name: "Hydrangea",
  growth_style: "compact",
  light_needs: "bright indirect",
  water_needs: "high",
  care_level: "medium",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: false,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252715/hydrangea_qv7pta.avif"
)

Plant.create!(
  name: "Clusia",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252714/clusia_pvvkxa.avif"
)

Plant.create!(
  name: "Tradescantia",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252716/Tradescantia_cpb3lk.avif"
)

Plant.create!(
  name: "Ilex",
  growth_style: "bushy",
  light_needs: "direct sun",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "outdoor",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252715/Ilex_vqnkxy.avif"
)

Plant.create!(
  name: "Lavender",
  growth_style: "bushy",
  light_needs: "direct sun",
  water_needs: "low",
  care_level: "medium",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252715/Lavender_t6kvpp.avif"
)

Plant.create!(
  name: "Spider Plant",
  growth_style: "trailing",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "easy",
  indoor_outdoor: "indoor",
  pet_safe: true,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252716/spider_plant_lznxzi.avif"
)

Plant.create!(
  name: "Calathea Orbifolia",
  growth_style: "bushy",
  light_needs: "low",
  water_needs: "moderate",
  care_level: "advanced",
  indoor_outdoor: "indoor",
  pet_safe: true,
  air_purifying: true,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252714/calathea_orbifolia_leyfia.avif"
)

Plant.create!(
  name: "Begonia",
  growth_style: "bushy",
  light_needs: "bright indirect",
  water_needs: "moderate",
  care_level: "medium",
  indoor_outdoor: "indoor",
  pet_safe: false,
  air_purifying: false,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252714/begonia_bstt0x.avif"
)

Plant.create!(
  name: "Super Dwarf Cavendish",
  growth_style: "upright",
  light_needs: "bright indirect",
  water_needs: "high",
  care_level: "advanced",
  indoor_outdoor: "both",
  pet_safe: false,
  air_purifying: false,
  image_url: "https://res.cloudinary.com/dqdg8zlau/image/upload/v1776252716/super_dwarf_cavendish_lj2fci.avif"
)

puts "Finished! Created #{Plant.count} plants."
