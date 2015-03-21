class Plant
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name,               type: String
  field :planting,           type: String
  field :pests,              type: String
  field :blooming,           type: String
  field :fertilization,      type: String
  field :species_name,       type: String
  field :latin_name,         type: String
  field :hardiness_zone_min, type: Integer
  field :temperature_max,    type: Integer
  field :temperature_min,    type: Integer
  field :fertilizer,         type: Integer
  field :sun,                type: Integer
  field :water,              type: Integer
  field :seasons,            type: Hash
end   