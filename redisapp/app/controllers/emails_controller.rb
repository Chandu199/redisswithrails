class EmailsController < ApplicationController
	rescue_from Net::OpenTimeout, :with => :mail_not_sent

	def mail_not_sent
		redirect_to emails_path, notice: "Email not sent"
	end

  def index

  end

  def standard
  	SendMail.default_mail(recipients).deliver
  	AnotherMail.default_mail(recipients).deliver
  	redirect_to emails_path, notice: "Sent emial (standard)"
  end

  def delayed
  	SendMailWorker.perform_async("SendMail",recipients)
  	SendMailWorker.perform_async("AnotherMail",recipients)
  	redirect_to emails_path, notice: "Sent emial (delayed)"
  end

  private
  def recipients
  	["n.chandrakanth0@gmail.com","chandu@indiahikes.com"]
  end
end
