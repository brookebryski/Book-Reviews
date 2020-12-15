module ReviewsHelper

    def display_header
        if params[:book_id]
            content_tag(:h1, "Add a Review for #{review.book.title} -  #{review.book.author.name}")
        else
          content_tag(:h1, "Write a review")
        end
    end

end
