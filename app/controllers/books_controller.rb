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
        redirect_to '/reading_list'
    end

    def search
       search = params[:q]
       @request = JSON.parse(RestClient.get "https://www.googleapis.com/books/v1/volumes?q=intitle:#{search}&maxResults=10")["items"]
       @books = Book.all
       render 'index'
    end

    def new_book_from_api
        raise params.inspect
    end

    private

    def find_book
        @book = Book.find(params[:id])        
    end

end
