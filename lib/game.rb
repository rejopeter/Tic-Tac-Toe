# game.rb
# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Logic to play
class Game
  def initialize(player1, player2, board = Board.new)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player = @player1
  end

  def valid_move
    # Display the current state of the board
    @board.display
    # Display the move position of the board to place marker
    @board.move
    # Ask the current player to enter a move
    puts "Player #{@current_player.name}, enter a number from the board to move for #{@current_player.marker} :"
    input = gets.chomp.to_i
    # Validate that the input is within the valid range of 1 to 9
    until valid_move_input?(input)
      puts "Invalid input. Please enter a number from the board to mark #{@current_player.marker}"
      input = gets.chomp.to_i
    end
    input
  end

  # Checks if a move input is between 1 and 9
  def valid_move_input?(input)
    input.between?(1, 9)
  end

  # Alternates the current player between player1 and player2
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Displays the winner message
  def win(winner)
    @board.display
    winner_name = @player1.marker == winner ? @player1.name : @player2.name
    puts "Player #{winner_name} wins! Game over."
  end

  # Checks if the game is over due to a win or a draw
  def game_over?(winner)
    if winner
      # If there is a winner, display the win message and end the game
      win(winner)
      true
    elsif @board.full?
      # If the board is full and no winner, it's a draw
      @board.display
      puts "The board is full. It's a draw!"
      true
    else
      # Game is not over yet
      false
    end
  end

  # main game loop
  def play
    loop do
      input = valid_move
      # Validate the move and update the board if valid
      if @board.update_board(input, @current_player.marker)
        # Check if there is a winner or draw and announce the result
        winner = @board.winner?
        break if game_over?(winner)

        switch_player
      else
        # Inform the player if the move is invalid or the cell is occupied
        puts 'Move invalid or cell occupied. Try again.'
      end
    end
  end
end
