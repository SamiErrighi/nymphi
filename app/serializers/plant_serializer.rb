class PlantSerializer < ActiveModel::Serializer
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
             :seasons,
             :profile_ids
    def profile_ids
        object.profiles.map { |p|
            p.id
        }
    end
end
