module Api
    class PlantsController < ApplicationController
        def index
            @plants = Plant.all
            render json: @plants
        end

        def show
        end

        def create
            render json: params
        end
    end
end