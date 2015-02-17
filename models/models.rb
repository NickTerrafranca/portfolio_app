require 'pg'
require 'pony'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: 'portfolio_app')
    yield(connection)
  ensure
    connection.close
  end
end


def save_message(name, email, content)
  sql = "INSERT INTO messages (name, email, content, created_at)" +
  "VALUES ($1, $2, $3, NOW());"
  connection = PG.connect(dbname: 'portfolio_app')
  connection.exec_params(sql, [name, email, content])
  connection.close
end

# def email_message(name, email, content)
#   Pony.options = {
#     :subject => "Portfolio page: Message delivery from #{params[:name]}",
#     :body => "From: #{params[:name]} #{params[:email]}\n#{params[:content]}",
#     :via => :smtp,
#     :via_options => {
#       :address              => 'smtp.1and1.com',
#       :port                 =>  '587', #'465',
#       :enable_starttls_auto => true,
#       :user_name            => 'noreply@nterrafranca.com', #ENV["USER_EMAIL_ADDRESS"]
#       :password             => "0Mu8-gg2-in8", #ENV["SMTP_PASSWORD"],
#       :authentication       => :login, # :plain, :login, :cram_md5, no auth by default
#       :domain               => 'nterrafranca.com'
#     }
#   }
#   Pony.mail(:to => 'nterrafranca@icloud.com')# ENV["DESTINATION_EMAIL_ADDRESS"]
# end

def email_message(name, email, content)
  Pony.options = {
    :subject => "Portfolio page: Message delivery from #{params[:name]}",
    :body => "From: #{params[:name]} #{params[:email]}\n#{params[:content]}",
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 =>  '587', #'465',
      :enable_starttls_auto => true,
      :user_name            => 'nterrafranca@gmail.com', #ENV["USER_EMAIL_ADDRESS"]
      :password             => "Mr_Milo-0026-Gross", #ENV["SMTP_PASSWORD"],
      :authentication       => :login, # :plain, :login, :cram_md5, no auth by default
      :domain               => 'gmail.com'
    }
  }
  Pony.mail(:to => 'nterrafranca@icloud.com')# ENV["DESTINATION_EMAIL_ADDRESS"]
end
