module Api
  module V1
    class TemperaturesController < ApplicationController
        def check
            render json: Temp::check(params[:value])
        end
    end
  end
end