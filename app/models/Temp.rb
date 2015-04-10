class Temp < PlantData
    @max = 1000
    def self.check(value)
       temp = Profile.first.plant.temperature_max

       value.to_i > temp ? false: true
    end
    def state
       moyTemp = Profile.first.plant.sun
       minTemp = Profile.first.plant.temperature_min
       maxTemp = Profile.first.plant.temperature_max

       if self.value <= maxTemp && self.value >= minTemp
           "green"
       elsif self.value > maxTemp
           "red"
       else
           "blue"
       end
   end
end