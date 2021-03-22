class UsersController < ApplicationController
    
    get '/users/signup' do
       erb :'/users/signup'
    end
        #create action
    post '/users/signup' do
        #params[:username]
        #params[:password]
        @user = User.create(username: params[:username], password: params[:password])
        redirect to "/users/#{@user.id}"
    end
          #show page  PATCH/UPDATE
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/show'
    end



end