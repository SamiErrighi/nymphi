class ProfilesController < ApplicationController

    def update
        @profile = Profile.find(params[:id])
        @profile.update(params_profile)
        redirect_to root_path
    end

    def params_profile
        params.require(:profile).permit!
    end
end
