module Api
    class HumiditiesController < ApplicationController
        def index
            @humidities = Humidity.all
            render json: @humidities
        end
    end
end