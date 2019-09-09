class WelcomeController < ApplicationController

    before_action :authentication_required, :current_user
    
    def homepage
        render 'homepage'
    end
end