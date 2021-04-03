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



























































# class UsersController < ApplicationController
    
#     get '/users/signup' do
#        erb :'/users/signup'
#     end
#         #create action
#     post '/users/signup' do
#         if params[:username] == "" && params[:password] == ""
#             redirect to "/users/signup"
#         else
#             @user = User.create(
#             username: params[:username], 
#             password: params[:password]
#         )
#             session[:user_id] = @user.id
#             redirect to "/users/#{@user.id}"
#         end
#     end

#     get '/users/login' do
        
#         if !logged_in?
#             erb :'/users/login' 
#         else
#             @user = User.find(session[:user_id])
#             redirect "/users/#{@user.id}"
#         end
#     end

#     post '/users/login' do
       
#         @user = User.find_by(username: params[:username])

#         if @user && @user.authenticate(params[:password])
#             session[:user_id] = @user.id
#             redirect to "/users/#{@user.id}"
#         else
#             redirect to "/users/login"
#         end
#     end
    
#     get '/users/logout' do
#             session.clear
#             redirect to '/'
#         end
    
#     get '/users/:id' do
       
#         @user = User.find(params[:id])
#         erb :'/users/show'
#     end



# end