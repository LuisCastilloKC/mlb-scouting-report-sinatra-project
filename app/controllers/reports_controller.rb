class ReportsController < ApplicationController


#Create

get '/reports/new' do
    erb :'/reports/new'
end

post '/reports' do
    @report = Report.create(
        player_name: params[:player_name], 
        bats: params[:bats], 
        throws: params[:throws], 
        drafted: params[:drafted], 
        position: params[:position], 
        age: params[:age], 
        day_of_birth: params[:day_of_birth], 
        height: params[:height], 
        weight: params[:weight]
    )
   redirect to "/reports/#{@report.id}"
end


#Read
get '/reports/:id' do
    @report = Report.find(params[:id])
    erb :'/reports/show'
end

get '/reports' do
    @reports = Report.all #return an array
    erb :'/reports/index'
end


#Update




#Delete







end
