# Player.rb
# frozen_string_literal: true

# Class to represent a player in the Tic-Tac-Toe game
# Each player has a name and a marker (like 'X' or 'O')
class Player
  # attr_reader creates getter methods for name and marker
  # so you can read these attributes but not modify them directly
  attr_reader :name, :marker

  # Constructor method to initialize a new player with a name and a marker

  # @param name [String] the player's name
  # @param marker [String] the player's marker symbol (e.g., "X" or "O")
  def initialize(name, marker)
    @name = name        # store player's name
    @marker = marker    # store player's marker
  end

  # Prints player information to the console
  # Example output: "Alice is playing as X"
  def info
    puts "#{@name} is playing as #{@marker}"
  end
end
