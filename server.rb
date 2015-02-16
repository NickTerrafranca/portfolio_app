require 'sinatra'
require 'pony'
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
    Pony.mail(to: 'nterrafranca@icloud.com', from: params[:email], subject: "Portfolio page: Message delivery from #{params[:name]}", body: params[:content])
    save_message(params[:name], params[:email], params[:content])
    # binding.pry
  end
  redirect '/'
end
