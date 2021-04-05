class UsersController < ApplicationController
    
    get '/users/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            @user = User.find(session[:user_id])
            redirect "/users/#{@user.id}"
        end
    end
        #create action
    post '/users/signup' do
        @user_found = User.find_by(username: params[:username].downcase)
        @email_found = User.find_by(email: params[:email].downcase)
        if params[:username] != "" && params[:password] != "" && params[:email] != ""
        
            if !@user_found && !@email_found
                @user = User.create(
                    username: params[:username].downcase, 
                    password: params[:password],
                    email: params[:email].downcase

                )
                session[:user_id] = @user.id
                redirect to "/users/#{@user.id}"
                
            else
                flash[:error] = "USER FOUND TRY DIFFERENT USER"
                redirect to "/users/signup"
            end
        else
            flash[:error] = "PLEASE FILL THE EMPTY FIELD"
            redirect to "/users/signup"
        
        end
    end


end
