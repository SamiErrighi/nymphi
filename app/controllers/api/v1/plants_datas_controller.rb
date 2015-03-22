module Api
  module V1
    class PlantsDatasController < ApplicationController
      def index
          @plantsDatas = PlantData.all
          render json: @plantsDatas
      end

      def humidity
          @humidities = Humidity.all
          render json: @humidities
      end
    end
  end
end