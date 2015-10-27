require 'sinatra'
require 'pony'
require 'dotenv'

require_relative 'models/models'

get '/' do
  erb :index
end

get '/tools' do
  erb :tools
end


get '/contact' do
  erb :contact
end

post '/contact' do
  if params[:name] == '' || params[:email] == '' || params[:content] == ''
    @content_error = "Please complete all form fields"
    redirect '/contact?error=Please+complete+all+form+fields'
  else
    email_message(params[:name], params[:email], params[:content])
    redirect '/'
  end
end
