class PlantSerializer < ActiveModel::MongoidSerializer
  attributes :id,
             :name,
             :planting,
             :pests,
             :blooming,
             :fertilization,
             :species_name,
             :latin_name, 
             :hardiness_zone_min,
             :temperature_max,
             :temperature_min,
             :fertilizer,
             :sun,
             :water,
             :seasons
end
