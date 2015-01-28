require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex = Rolodex.new

get '/'  do
	@crm_name = "My CRM"
	erb :index
end

get '/contacts' do
	@contacts = $rolodex.contacts
  erb :contacts
end

# get '/contacts/:id' do

# end

get '/contacts/new_contact' do
	erb :new_contact
end

post '/contacts' do
	# p params: params
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
	redirect '/contacts'
end