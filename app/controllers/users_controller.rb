class UsersController < ApplicationController
    
    get '/users/signup' do
       erb :'/users/signup'
    end
        #create action
    post '/users/signup' do
        if params[:username] == "" && params[:password] == ""
            redirect to "/users/signup"
        else
            @user = User.create(
            username: params[:username], 
            password: params[:password]
        )
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        end
    end





    # get '/users/login' do
    #     # if the user is logged in 
    #     # redirect to their home page
    #     # else show them the log in form
    #     if !logged_in?
    #         erb :'/users/login' 
    #     else
    #         @user = User.find(session[:user_id])
    #         redirect "/users/#{@user.id}"
    #     end
    # end

    get '/users/login' do 
        if logged_in?   
           redirect "/users/#{current_user.id}"  
        else
           erb :'/users/login'
        end 
       end 





    post '/users/login' do
        # want to find the user, if it exists
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        #authenticate passoword
        else
            redirect to "/users/login"
            #not valid

        end
    end
    
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end


    # get '/users/logout' do
    #     session.clear
    #     redirect '/'
    # end


end