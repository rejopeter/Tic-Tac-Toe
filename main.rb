# main.rb
# frozen_string_literal: true

# Tic-Tac-Toe game

require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

# Prompt users for two unique, non-empty player names
def unique_player_names
  loop do
    puts 'Player 1 Enter name for X :'
    name1 = gets.chomp.strip
    puts 'Player 2 Enter name for O :'
    name2 = gets.chomp.strip
    return [name1, name2] if unique_names?(name1, name2) == true
  end
end

def unique_names?(name1, name2)
  if name1.empty? || name2.empty?
    puts 'Player names cannot be empty. Please try again.'
    false
  elsif name1 == name2
    puts 'Both players cannot have the same name. Please enter different names.'
    false
  else
    true
  end
end

# Retrieve and store the unique player names
names = unique_player_names

# Create two Player objects with assigned markers
@player1 = Player.new(names[0], 'X')
@player2 = Player.new(names[1], 'O')

# display the player info
puts "\n"
@player1.info
@player2.info
puts "\n"

# Initialize the game board
board = Board.new

# Set up the game instance with the players and board, and start the game
game = Game.new(@player1, @player2, board)
game.play
