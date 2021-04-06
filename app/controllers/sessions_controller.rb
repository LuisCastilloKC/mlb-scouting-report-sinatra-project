class SessionsController < ApplicationController
 
    get '/users/login' do
            if !logged_in?
            erb :'/users/login'        
        else
            @user = User.find(session[:user_id])
            redirect "/users/#{@user.id}"
        end
    end

    post '/users/login' do
        @user = User.find_by(username: params[:username].downcase)
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/reports"
        else
            flash[:error] = "INVALID LOGIN"
            redirect to "/users/login"
        end
    end
    
    get '/users/logout' do
        session.clear
        redirect to '/'
    end
    
    get '/users/:id' do
        if current_user && logged_in?
            @user = User.find(params[:id])
            erb :'/users/show'
        else
            redirect to "/"
        end
    end
end