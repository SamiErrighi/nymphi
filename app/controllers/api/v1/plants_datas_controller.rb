module Api
  module V1
    class PlantsDatasController < ApplicationController
      def index
          @plantsDatas = PlantData.all
          render json: @plantsDatas
      end
      def add
        profile = Profile.first
        Humidity.create(value: params[:humidity].to_f, profile: profile)
        Luminosity.create(value: params[:luminosity].to_f, profile: profile)
        Temp.create(value: params[:temp].to_f, profile: profile)
        render json: 'created', status: 201
      end

      def info
        water = Humidity::min_max
        light = Luminosity::min_max
        data = {
            :minWater => water[0],
            :maxWater => water[1],
            :minLight => light[0],
            :maxLight => light[1],
            :minTemp => Profile.first.plant.temperature_min,
            :maxTemp => Profile.first.plant.temperature_max,
        }
        render json: data
      end
    end
  end
end