module Api
  module V1
    class LuminositiesController < ApplicationController
        def check
            render json: Luminosity::check(params[:value])
        end
    end
  end
end