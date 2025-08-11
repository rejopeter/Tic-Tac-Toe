#main.rb

#Tic-Tac-Toe game

require_relative 'board'
require_relative 'player'
require_relative 'game'

# Prompt users for two unique, non-empty player names
def get_unique_player_names
  loop do
    puts "Player 1 Enter name for X :"
    name1 = gets.chomp.strip
    puts "Player 2 Enter name for O :"
    name2 = gets.chomp.strip

    if name1.empty? || name2.empty?
      puts "Player names cannot be empty. Please try again."
      next
    end

    if name1 == name2
      puts "Both players cannot have the same name. Please enter different names."
    else
      return [name1, name2]
    end
  end
end

# Retrieve and store the unique player names
names = get_unique_player_names

# Create two Player objects with assigned markers
@player1 = Player.new(names[0], "X")
@player2 = Player.new(names[1], "O")

#display the player info
puts "\n"
@player1.info
@player2.info
puts "\n"

# Initialize the game board
board = Board.new

# Set up the game instance with the players and board, and start the game
game = Game.new(@player1, @player2, board)
game.play