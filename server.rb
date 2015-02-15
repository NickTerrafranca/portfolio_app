require 'pry'
require 'sinatra'
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
