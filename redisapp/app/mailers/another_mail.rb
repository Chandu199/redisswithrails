class AnotherMail < ApplicationMailer
	default from: "from@gmail.com"
	
	def default_mail recipients
		mail(to: recipients, subject: "Bye", )
	end
end
