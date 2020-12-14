class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:id])
        @review = @book.reviews.build
    end

    def create
        @review = Review.new(review_params)
        if @review.save
        redirect_to review_path(@review)
        else
          render :new
        end
    end


    def index
    end

    private

    def review_params
        params.require(:review). permit(:book_id, :content, :stars, :title)
    end

end

