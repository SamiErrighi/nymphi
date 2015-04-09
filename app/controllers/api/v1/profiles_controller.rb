module Api
  module V1
    class ProfilesController < ApplicationController
      def index
        @profil = Profile.all
        render json: @profil
      end

      def update
        @profile = Profile.find(params[:id]);
        @profile.update(profile_params);
        render json: @profile, status: 204
      end

      private

      def profile_params
        params.require(:profile).permit!
      end
    end
  end
end