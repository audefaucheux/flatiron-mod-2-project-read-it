class BooksController < ApplicationController

    before_action :authentication_required, :current_user
    before_action :find_book, only: [:show]

    def index
        @books = Book.all
    end

    def show
    end

    def search
       @search = params[:q]
       @request = JSON.parse(RestClient.get "https://www.googleapis.com/books/v1/volumes?q=intitle:#{@search}&maxResults=10")["items"]
       render 'index'
    end

    def add_to_reading_list_via_api

        if params["book"]["author"].empty?
            author = Author.find_or_create_by(name: "Anonymous")
        else
            author = Author.find_or_create_by(name: params["book"]["author"])
        end

        if params["book"]["genre"].empty?
            genre = Genre.find_or_create_by(name: "None")
        else
            genre = Genre.find_or_create_by(name: params["book"]["genre"])
        end
        
        book = Book.find_or_create_by(
            title: params["book"]["title"], 
            synopsis: params["book"]["synopsis"],
            published_date: params["book"]["published_date"],
            genre_id: genre.id,
            author_id: author.id,
            img_url: params["book"]["img_url"]
        )

        @current_user.books << book

        @search = (params[:search]).delete('\\"')
        redirect_to "/search?q=#{@search}&commit=Search"
    end

    def remove_from_reading_list_via_api
        ReadingList.find_by(user_id: @current_user.id, book_id: params[:book_id]).destroy
        @search = params[:search]
        redirect_to "/search?q=#{@search}&commit=Search"
    end

    def remove_from_reading_list
        ReadingList.find_by(user_id: @current_user.id, book_id: params[:book_id]).destroy
        @search = params[:search]
        redirect_to "/reading_list"
    end

    private

    def find_book
        @book = Book.find(params[:id])        
    end

end
