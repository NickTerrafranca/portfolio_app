Dotenv.load

def email_message(name, email, content)
  Pony.options = {
    :subject => "Portfolio page: Message delivery from #{params[:name]}.",
    :body => "From: #{params[:name]}, #{params[:email]}\n#{params[:content]}",
    :via => :smtp,
    :via_options => {
      :address              => ENV["SMTP_ADDRESS"],
      :port                 => ENV["PORT"],
      :enable_starttls_auto => true,
      :user_name            => ENV["USER_EMAIL_ADDRESS"],
      :password             => ENV["SMTP_PASSWORD"],
      :authentication       => :login,
      :domain               => ENV["DOMAIN"]
    }
  }

  Pony.mail(:to => ENV["DESTINATION_EMAIL_ADDRESS"])
end
