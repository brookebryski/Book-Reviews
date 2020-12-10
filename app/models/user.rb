class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_books, through :reviews, source: :book 

    has_many :books
end
