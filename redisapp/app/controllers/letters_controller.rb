class LettersController < ApplicationController
	def index
		@letters = Letter.all.limit(100)
	end

	def upvote
		@letter = Letter.find(params[:id])
		@letter.update_attribute(:score, @letter.score + 1)
		LetterRedisRepository.increment @letter
		MessageWorker.perform_async("Anonymous","hey hi #{@letter.name} is the upvoted", letters_url)

		redirect_to  letters_path, notice: "Upvoted Letter"
	end

	def downvote
		@letter = Letter.find(params[:id])
		@letter.update_attribute(:score, @letter.score - 1)
		LetterRedisRepository.decrement @letter
		MessageWorker.perform_async("Anonymous","hey hi #{@letter.name} is the downvoted", letters_url)
		redirect_to  letters_path, notice: "Downvoted Letter"
	end
end