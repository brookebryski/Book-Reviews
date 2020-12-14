class ReviewsController < ApplicationController

    def new
        @book = Book.find_by_id(params[:id])
        @review = @book.build_review
    end

    def index
    end
end
