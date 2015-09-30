# This is a number guessing game.
require "pry"
# require "./human"
# require "./random"
# require "./counting"
require "./smart_2"

class GuessingGame
	def initialize(player)
		@player = player
	end

	def play
		count = 1
		result = :first
		number = rand(1..100)

		guess = @player.get_guess(result)
		
		until guess == number
			puts "The number is #{number} and the guess is #{guess}."
			if guess > number
				result = :high
			else
				result = :low
			end
			guess = @player.get_guess(result)
			count += 1
		end
		puts "The number was #{number} and you guessed #{guess}."
		puts "\nYou win! It took you >>:: #{count} ::<< tries."
		puts "\nGo'on have you a beer, boy, (or lady ;)"
			
	end
end

game = GuessingGame.new(SmartPlayer.new)
game.play