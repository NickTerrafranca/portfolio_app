Dotenv.load

def email_message(name, email, content)
  Pony.options = {
    :from => 'noreply@nterrafranca.com',
    :via => :smtp,
    :subject => "Message delivery from #{name}",
    :body => "From: #{name},\n#{content}\n#{email}",
    :via_options => {
      :host => 'smtp.nterrafranca.com',
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
    }
  }
  Pony.mail(:to => ENV["DESTINATION_EMAIL_ADDRESS"])
end
