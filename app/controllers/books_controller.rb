class BooksController < ApplicationController

    def new
       @book = Book.new
       @book.build_author
    end

    def create 
        @book = Book.new(book_params)
        if @book.save
        redirect_to book_path(@book)
        else
        render :new
    end
  end
    private

    def book_params
        params.require(:book).permit(:title, :description, :genre, :author_id, author_attributes: [:name])
    end

end
