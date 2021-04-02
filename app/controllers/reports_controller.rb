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
    @report = Report.new(params)
    @report.user_id = session[:user_id]
    @report.save
    redirect to "/reports/#{@report.id}"
end

# post '/reports' do
#     @report = Report.create(
        
#         player_name: params[:player_name], 
#         bats: params[:bats], 
#         throws: params[:throws], 
#         drafted: params[:drafted], 
#         position: params[:position], 
#         age: params[:age], 
#         day_of_birth: params[:day_of_birth], 
#         height: params[:height], 
#         weight: params[:weight]
#     )
#     redirect to "/reports/#{@report.id}"
# end


#Read
get '/reports/:id' do
    @report = Report.find(params[:id])
    erb :'/reports/show'
end



#edit route

get '/reports/:id/edit' do
    @report = Report.find_by_id(params[:id])
    if @report.user == current_user
        erb :'/reports/edit'
    else
        flash[:error] = "NOT AUTHORIZE TO EDIT THIS REPORT"
        redirect to '/reports'
    end
end

#update route
patch '/reports/:id' do
    @report = Report.find(params[:id])
    @report.update(
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

delete '/reports/:id/delete' do
    @report = Report.find_by_id(params[:id])    
    if @report
        @report.delete
    end
        redirect to '/reports'
    end
end



















































#     get '/reports/' do
#         if current_user
#         @reports = Report.all #return an array
#         erb :'/reports/index'
#         end
#     end

# #Create

# get '/reports/new' do
#     erb :'/reports/new'
# end
# #Read
# get '/reports/:id' do
#     @report = Report.find(params[:id])
#     erb :'/reports/show'
# end


# post '/reports' do
#     @report = Report.new(
#         player_name: params[:player_name], 
#         bats: params[:bats], 
#         throws: params[:throws], 
#         drafted: params[:drafted], 
#         position: params[:position], 
#         age: params[:age], 
#         day_of_birth: params[:day_of_birth], 
#         height: params[:height], 
#         weight: params[:weight]
#     )
#     redirect to "/reports/#{@report.id}"
# end





# #Update

# get '/reports/:id/edit' do
#     @report = Report.find(params[:id])
#     erb :'/reports/edit'
# end

# post '/reports/:id' do
#     @report = Report.find(params[:id])
#     @report.update(
#         player_name: params[:player_name], 
#         bats: params[:bats], 
#         throws: params[:throws], 
#         drafted: params[:drafted], 
#         position: params[:position], 
#         age: params[:age], 
#         day_of_birth: params[:day_of_birth], 
#         height: params[:height], 
#         weight: params[:weight]
#     )
#     redirect to "/reports/#{@report.id}"
# end

# delete '/reprots/:id' do
#     @report = Report.find(params[:id])    
#     @report.destroy
#     redirect to '/reports'
#     end
# end











