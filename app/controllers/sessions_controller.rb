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
            #redirect to "/users/#{@user.id}"
            redirect to "/reports"
        else
            flash[:error] = "Invalid login"
            redirect to "/users/login"
        end
    end
    
    get '/users/logout' do
            session.clear
            redirect to '/'
        end
    
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    

end