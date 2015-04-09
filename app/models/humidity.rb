class Humidity < PlantData
    @max = 1000
    def self.get_computed_value(profile, value)
       water = profile.plant.water
       indice = water * @max / 5
       value < indice ? false: true
    end
end