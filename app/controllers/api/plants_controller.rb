module Api
    class PlantsController < ApplicationController
        def index
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
            seasons = plant_params.delete("seasons")
            seasons = params[:plant][:seasons]
        end
    end
end