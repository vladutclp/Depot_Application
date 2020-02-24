# Load the Rails application.
require_relative 'application'



Depot::Application.configure do
	config.action_mailer.delivery_method = :smtp
	config.action_mailer.perform_deliveries = true
	config.action_mailer.smtp_settings = {
		adress: 							"smtp.gmail.com",
		port: 			    			587,
		domain:         			"domain.of.sender.net",
		authentication: 			"plain",
		user_name:  					"dave",
		password:       		  "secret",
		enable_starttls_auto: true
	}
end

# Initialize the Rails application.
Rails.application.initialize!

