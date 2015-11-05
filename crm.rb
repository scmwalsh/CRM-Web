require_relative 'contact'
require 'sinatra'

Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")



get '/' do
	@crm_app_name = "Design"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
redirect to ('/contacts')
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  erb :show_contact
end


