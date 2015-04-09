class HomeController < ApplicationController
    def index
        @profile = Profile.first
    end
end
