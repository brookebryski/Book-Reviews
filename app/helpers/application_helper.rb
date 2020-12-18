module ApplicationHelper
    def navigation
        if logged_in?
         render partial: 'layouts/loggedin_paths'
        else
        render partial: 'layouts/loggedout_paths'
        end
    end
end
