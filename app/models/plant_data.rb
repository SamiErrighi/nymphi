class PlantData
  include Mongoid::Document
  field :value, type: Float
  belongs_to :plant
end
