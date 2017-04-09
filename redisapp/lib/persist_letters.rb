class PersistLetters

	def execute number
		PopulateLetters.new(number).execute do |letter|
			Letter.create! name: letter, description: "This is the description of letter #{letter}", score: Random.rand(1001)
		end
	end
end