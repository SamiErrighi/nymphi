class Humidity < PlantData
    @max = 1000
    def self.check(value)
       water = Profile.first.plant.water
       indice = water * @max / 5
       value.to_i < indice ? false: true
    end

    def self.min_max
        moyWater = Profile.first.plant.water * 1000 / 5
        minWater = moyWater - 250
        maxWater = moyWater + 250
        [minWater, maxWater]
    end
    def state
       moyWater = Profile.first.plant.water * 1000 / 5
        minWater = moyWater - 250
        maxWater = moyWater + 250
       if self.value <= maxWater && self.value >= minWater
           "green"
       elsif self.value < minWater
           "red"
       else
           "blue"
       end
   end
end