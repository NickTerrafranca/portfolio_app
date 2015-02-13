require 'pry'
require 'sinatra'
require_relative 'models/models'


get '/' do
  erb :index
end
