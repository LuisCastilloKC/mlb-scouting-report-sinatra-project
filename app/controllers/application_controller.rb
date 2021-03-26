require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions          #secrect Password
    set :session_secrect, '5Wj!6#85WdHJ#%*!.Ols61Ii1'
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end
  end

end
