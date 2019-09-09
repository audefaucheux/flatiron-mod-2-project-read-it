class BooksController < ApplicationController

    before_action :authentication_required, :current_user
    before_action :find_book, only: [:show]

    def index
        @books = Book.all
    end

    def show
    end

    private

    def find_book
        @book = Book.find(params[:id])        
    end

end
