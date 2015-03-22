module Api
  module V1
    class PlantsController < ApplicationController

      def index
        @plants = Plant.all
        render json: @plants
      end

      def show
      end

      def create
        @plant = Plant.new(plant_params)
        @plant.seasons = seasons_params
        @plant.save
        render json: @plant
      end

      private
      def plant_params
        params.require(:plant).permit(
          :name,
          :planting,
          :pests,
          :blooming,
          :fertilization,
          :hardiness_zone_min,
          :temperature_max,
          :temperature_min,
          :fertilizer,
          :sun,
          :water,
          :species_name,
          :latin_name,
          :seasons
        )
      end

      def seasons_params
        plant_params.delete('seasons')
        params[:plant][:seasons]
      end
    end
  end
end