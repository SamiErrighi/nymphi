module Api
  module V1
    class HumiditiesController < ApplicationController
      def index
        @humidities = Humidity.all
        render json: @humidities
      end

      def create
        humidity = Humidity.new(humidity_params)
        humidity.profile = Profile.first
        humidity.save
        render json: "created", status: 201
      end
        def check
            render json: Humidity::check(params[:value])
        end

      private
      def humidity_params
        params.require(:humidity).permit(:value);
      end
    end
  end
end