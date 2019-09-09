class ReviewsController < ApplicationController

    before_action :authentication_required, :current_user

    def new
    end

    def create
        raise params.inspect
    end


end
