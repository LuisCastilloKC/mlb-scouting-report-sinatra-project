require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # eneble :sessions          #secrect Password
    use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'
    set :session_secrect, '5Wj!6#85WdHJ#%*!.Ols61Ii1'
    register Sinatra::Flash
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
