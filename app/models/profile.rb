class Profile
  include Mongoid::Document
  include Mongoid::Timestamps

  validates_presence_of :name

  field      :name, type: String
  has_many   :plant_datas, class_name: 'PlantData'
  has_many   :humidities, class_name: 'Humidity'
  has_many   :luminosities, class_name: 'Luminosity'
  has_many   :temps, class_name: 'Temp'
  belongs_to :plant
end
