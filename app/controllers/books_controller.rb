class BooksController < ApplicationController
    before_action :set_book, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    
    def new
       @book = Book.new
       @book.build_author
    end

    def create 
        @book = Book.new(book_params)
        @book.user_id = session[:user_id]
        if @book.save
        redirect_to book_path(@book)
        else
        render :new
    end
  end

   def index
    @books = Book.all
   end

   def show
   end

   def edit
   end

   def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
        render :edit
    end 
   end

    private

    def book_params
        params.require(:book).permit(:title, :description, :genre, :author_id, author_attributes: [:name])
    end

    def set_book
        @book = Book.find_by(params[:id])
        redirect_to books_path is !@book
    end

end
