class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
    
    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:error] = "Sorry, your username or password was incorrect"
          redirect_to '/login'
        end
      end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.username = auth['info']['name']
          u.email = auth['info']['email']
          u.password = auth['uid']   # Secure Random Hex
        end

        session[:user_id] = @user.id

        redirect_to '/books'
  end


    private 

    def auth
        request.env['omniauth.auth']
    end

end

