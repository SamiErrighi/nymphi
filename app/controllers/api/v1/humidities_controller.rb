module Api
  module V1
    class HumiditiesController < ApplicationController
      def index
        @humidities = Humidity.all
        render json: @humidities
      end

      def create
        humidity = Humidity.new(humidity_params)
        humidity.save
        render json: "creatred", status: 201
      end

      private
      def humidity_params
        params.require(:humidity).permit(:value);
      end
    end
  end
end