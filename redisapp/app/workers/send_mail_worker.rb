class SendMailWorker
	include Sidekiq::Worker
	def perform klass,recipients
		self.class.const_get(klass).
		default_mail(recipients).deliver
	end
end