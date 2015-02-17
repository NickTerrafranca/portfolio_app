require 'sinatra'
require 'pry'
require_relative 'models/models'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end


get '/contact' do
  erb :contact
end

post '/thankyou' do
  unless params[:name] == '' || params[:email] == '' || params[:content] == ''
    email_message(params[:name], params[:email], params[:content])
    save_message(params[:name], params[:email], params[:content])
  end
  redirect '/'
end
