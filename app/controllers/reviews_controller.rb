class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:id])
        @review = @book.reviews.build
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
        redirect_to review_path(@review)
        else
          render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end


    def index
        if params[:book_id]
            @book = Book.find_by_id(params[:book_id])
            @reviews = @book.reviews
        else
        @reviews = Review.all
    end
end
    private

    def review_params
        params.require(:review). permit(:book_id, :content, :stars, :title)
    end

end

