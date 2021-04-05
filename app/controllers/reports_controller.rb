class ReportsController < ApplicationController
   
get '/reports' do
     if current_user
     @reports = Report.all #return an array
     erb :'/reports/index'
     end
end
    
get '/reports/new' do
    erb :'/reports/new'
end

post '/reports' do
    if params[:player_name] == "" || params[:bats] == "" || params[:throws] == "" || 
       params[:drafted] == "" || params[:position] == "" || params[:age] == "" || 
       params[:day_of_birth] == "" || params[:height] == "" || params[:weight] == ""
        redirect to "/reports/new"
    else
        @report = Report.new(params)
        @report.user_id = session[:user_id]
        if @report.save
            redirect to "/reports/#{@report.id}"
        else
            flash[:error] = "PLEASE FILL THE EMPTY FIELD"
            redirect to "/reports/new"
        end
    end
end


#Read
get '/reports/:id' do
    @report = Report.find_by_id(params[:id])
    if @report && logged_in?
    erb :'/reports/show'
    else
        redirect to "/reports"
    end
end



get '/reports/:id/edit' do
    @report = Report.find_by_id(params[:id])
    if @report.user  == current_user && logged_in?
        erb :'/reports/edit'
    else
        flash[:error] = "NOT AUTHORIZE TO EDIT THIS REPORT"
        redirect to '/reports'
    end
end

patch "/reports/:id" do 
    if params[:player_name] == "" || params[:bats] == "" || params[:throws] == "" || 
        params[:drafted] == "" || params[:position] == "" || params[:age] == "" || 
        params[:day_of_birth] == "" || params[:height] == "" || params[:weight] == "" 
      redirect to "/posts/#{params[:id]}/edit"
    else 
      @report = Report.find_by_id(params[:id])
                                            #hash coming from the form
      if @report && @report.update(params[:reports])
        redirect to "/reports/#{@report.id}"
      else 
        redirect to "/reports/#{params[:id]}/edit"
      end
    end 
  end 


delete '/reports/:id/delete' do
    @report = Report.find_by_id(params[:id])    
    if @report.user == current_user
        @report.delete
    end
        redirect to '/reports'
    end
end



