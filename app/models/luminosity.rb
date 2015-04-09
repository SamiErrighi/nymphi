class Luminosity < PlantData
    @max = 1000
    def self.check(value)
       water = Profile.first.plant.sun
       indice = water * @max / 5
       value.to_i < indice ? false: true
    end

    def self.min_max
        moyLight = Profile.first.plant.sun * 1000 / 5
        minLight = moyLight - 250
        maxLight = moyLight + 250
        [minLight, maxLight]
    end
end