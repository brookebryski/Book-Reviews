class AuthorsController < ApplicationController
before_action :redirect_if_not_logged_in 

    def index
        if params[:q]
         @authors = Author.all.search(params[:q].downcase)
        else
        @authors = Author.all
       end
    end
end
