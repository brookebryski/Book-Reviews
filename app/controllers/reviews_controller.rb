class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:id])
        @review = @book.reviews.build
    end

    def index
    end
end
