class GenresController < ApplicationController

    before_action :authentication_required, :current_user

end
