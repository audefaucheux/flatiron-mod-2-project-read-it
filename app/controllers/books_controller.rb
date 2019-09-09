class BooksController < ApplicationController

    before_action :authentication_required, :current_user
    before_action :find_book, only: [:show]

    def index
        @books = Book.all
    end

    def show
    end

    def add_to_reading_list
        ReadingList.create(user_id: @current_user.id, book_id: params[:id])
        redirect_to '/books'
    end

    def remove_from_reading_list
        ReadingList.find_by(user_id: @current_user.id, book_id: params[:id]).destroy
        redirect_to '/books'
    end

    private

    def find_book
        @book = Book.find(params[:id])        
    end

end
