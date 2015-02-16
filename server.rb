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

# post '/thankyou' do
#   unless params[:name] == '' || params[:email] == '' || params[:content] == ''
#       Pony.mail({
#         :to => 'nterrafranca@icloud.com',
#         :via => :smtp,
#         :via_options => {
#           :address              => 'smtp.gmail.com',
#           :port                 => '587',
#           :enable_starttls_auto => true,
#           :user_name            => 'nterrafranca@gmail.com',
#           :password             => 'Mr_Milo-0026-Gross',
#           :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
#           :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
#         }
#       })
#     save_message(params[:name], params[:email], params[:content])
#     # binding.pry
#   end
#   redirect '/'
# end

# post '/thankyou' do
#   unless params[:name] == '' || params[:email] == '' || params[:content] == ''
#       Pony.mail({
#         :to => 'nterrafranca@icloud.com',
#         :via => :sendmail,
#         from: params[:email],
#         subject: "Portfolio page: Message delivery from #{params[:name]}",
#         body: params[:content],
#         :via_options => {
#           :location  => '/path/to/sendmail', # defaults to 'which sendmail' or '/usr/sbin/sendmail' if 'which' fails
#           :arguments => '-t' # -t and -i are the defaults
#           }
#       })
#     save_message(params[:name], params[:email], params[:content])
#     # binding.pry
#   end
#   redirect '/'
# end
