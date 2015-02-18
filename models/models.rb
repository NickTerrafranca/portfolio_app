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

def email_message(name, email, content)
  Dotenv.load
  Pony.options = {
    :subject => "Portfolio page: Message delivery from #{params[:name]}",
    :body => "From: #{params[:name]} #{params[:email]}\n#{params[:content]}",
    :via => :smtp,
    :via_options => {
      :address              => ENV["SMTP_ADDRESS"],
      :port                 =>  '587',
      :enable_starttls_auto => true,
      :user_name            => ENV["USER_EMAIL_ADDRESS"],
      :password             => ENV["SMTP_PASSWORD"],
      :authentication       => :login,
      :domain               => ENV["DOMAIN"]
    }
  }
  Pony.mail(:to => ENV["DESTINATION_EMAIL_ADDRESS"])
end
