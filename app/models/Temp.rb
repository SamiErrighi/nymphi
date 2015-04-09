class Temp < PlantData
    @max = 1000
    def self.check(value)
       temp = Profile.first.plant.temperature_max

       value.to_i > temp ? false: true
    end
end