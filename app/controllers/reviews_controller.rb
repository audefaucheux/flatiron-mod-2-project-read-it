class ReviewsController < ApplicationController

    before_action :authentication_required, :current_user
    before_action :find_review, only: [:edit, :update]

    def new
        @review = Review.new
        @book = Book.find(params[:book_id])
    end
    
    def create
        review = Review.create(review_params)
        book = Book.find(params[:review][:book_id])
        redirect_to book
    end

    def edit 
        @book = Book.find(params[:book_id])
    end

    def update 
        @review.update(review_params)
        book = Book.find(params[:review][:book_id])
        redirect_to book
    end 

    def destroy
        Review.find(params[:id]).destroy
        book = Book.find(params[:book_id])
        redirect_to book
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content, :user_id, :book_id)
    end

    def find_review 
       @review = Review.find(params[:id])
    end

end
