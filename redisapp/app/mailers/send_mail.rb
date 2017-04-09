class SendMail < ApplicationMailer
	default from: "from@gmail.com"

	def default_mail recipients
		mail(to: recipients, subject: "Hi", )
	end
end
