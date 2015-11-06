# require_relative 'contact'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
    include DataMapper::Resource

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :email, String
    property :notes, String
  end

  DataMapper.finalize
  DataMapper.auto_upgrade!

  #   attr_accessor: :id, :first_name, :last_name, :email, :notes

  # def initialize(first_name, last_name, email, notes)
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @notes = notes
  # end

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
  if @contact
  	erb :show_contact
  else
  	raise Sinatra::NotFound
	end
end

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
  	erb :edit_contacts
  else
  	raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.remove
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end




