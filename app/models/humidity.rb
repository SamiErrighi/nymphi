class Humidity < PlantData
    @max = 1000
    def self.check(value)
       water = Profile.first.plant.water
       indice = water * @max / 5
       value.to_i < indice ? false: true
    end
end