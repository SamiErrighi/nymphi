class PlantData
  include Mongoid::Document
  field :value, type: Float
  belongs_to :profile
end
