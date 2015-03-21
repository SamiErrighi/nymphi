class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  field    :name, type: String
  has_many :datas, class_name: "PlantData"
  has_one  :plant
end
