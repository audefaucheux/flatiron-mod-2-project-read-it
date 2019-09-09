class AuthorsController < ApplicationController

    before_action :authentication_required, :current_user
    before_action :find_author, only: [:show]

    def index
        @authors = Author.all
    end

    def show
    end

    private

    def find_author
        @author = Author.find(params[:id])        
    end

end
