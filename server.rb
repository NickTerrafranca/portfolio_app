require 'sinatra'
require 'pg'
require 'pony'
require 'dotenv'

require 'pry'

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

post '/thankyou' do
  unless params[:name] == '' || params[:email] == '' || params[:content] == ''
    email_message(params[:name], params[:email], params[:content])
    save_message(params[:name], params[:email], params[:content])
  else
    render '/thankyou'
  end
  redirect '/'
end
