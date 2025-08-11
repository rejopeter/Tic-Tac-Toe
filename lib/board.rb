# board.rb
# frozen_string_literal: true

# Class to represent the Tic-Tac-Toe board
# Handles board display, updating moves, and checking win/draw conditions
class Board
  # Initialize a new board instance
  # Creates a 3x3 grid represented as a two-dimensional array
  # Each cell is initialized with a space character ' ', indicating an empty spot
  def initialize
    # Create a 3x3 grid initialized with spaces representing empty cells
    @grid = Array.new(3) { Array.new(3, ' ') }
  end

  # Display the current state of the board on the console
  # Prints the grid with rows separated by horizontal lines and columns separated by vertical bars
  # Provides a visual representation of the current game state for players
  def display
    puts "\n" # Print a blank line for spacing
    @grid.each_with_index do |row, i|
      # Join the three cells of the row with ' | ' to separate columns visually
      puts " #{row.join(' | ')} "
      # After each row except the last, print a separator line to delineate rows
      puts '---+---+---' unless i == @grid.size - 1
    end
    puts "\n" # Print another blank line for spacing
  end

  # Display the numbered board positions for player reference
  # Shows the positions 1 through 9 arranged in a 3x3 grid to guide player input
  # This method helps players understand which number corresponds to which board cell
  def move
    puts 'Tic-Tac-Toe'
    puts ' 1 | 2 | 3 '
    puts '---+---+---'
    puts ' 4 | 5 | 6 '
    puts '---+---+---'
    puts ' 7 | 8 | 9 '
    puts "\n"
  end

  # Convert the player's chosen position (1-9) to grid indices (row, col)
  #
  # @param pos [Integer] position from 1 to 9 chosen by the player
  # @return [Array<Integer>] returns a two-element array containing the row and column indices on the grid
  #
  # Explanation:
  # The board positions are numbered 1 to 9 starting from the top-left corner moving left to right, top to bottom.
  # Internally, the grid is zero-indexed (0 to 2 for both rows and columns).
  # This method converts the 1-based position to zero-based row and column indices used to access the grid array.
  def position_to_indices(pos)
    pos -= 1       # Convert to zero-based index (0 to 8)
    row = pos / 3  # Integer division to find row (0 for positions 1-3, 1 for 4-6, 2 for 7-9)
    col = pos % 3  # Modulus to find column (0, 1, or 2)
    [row, col]
  end

  # Update the board at the given position with the player's marker if the cell is empty
  #
  # @param pos [Integer] position from 1 to 9 where player wants to place their marker
  # @param marker [String] player's marker symbol, typically "X" or "O"
  # @return [Boolean] returns true if the update was successful (cell was empty and marker placed),
  #                   false if the chosen position is already occupied
  #
  # Explanation:
  # This method first converts the player input position to grid indices.
  # It then checks if the corresponding cell in the grid is empty (contains a space).
  # If empty, it places the player's marker in the cell and returns true.
  # If not empty, it prints a warning message and returns false to indicate failure.
  def update_board(pos, marker) # rubocop:disable Naming/PredicateMethod
    row, col = position_to_indices(pos)

    # Check if cell is empty before placing marker
    if @grid[row][col] == ' '
      @grid[row][col] = marker
      true
    else
      puts 'Position already taken! Choose another position.'
      false
    end
  end

  # Generate all possible winning combinations on the board
  #
  # @return [Array<Array<String>>] returns an array containing arrays of 3 elements each,
  #   representing rows, columns, and diagonals on the board
  #
  # Explanation:
  # The method returns all lines that could result in a win:
  # - All rows (3 arrays)
  # - All columns (3 arrays, obtained by transposing the grid)
  # - The two diagonals (top-left to bottom-right and top-right to bottom-left)
  # These lines are used later to check if a player has won.
  def win_combinations
    # Combine rows, columns (transpose), and diagonals into a single array of lines
    @grid + @grid.transpose +
      [[@grid[0][0], @grid[1][1], @grid[2][2]],
       [@grid[0][2], @grid[1][1], @grid[2][0]]]
  end

  # Check if there is a winner on the board
  #
  # @return [String, false] returns the winning marker ("X" or "O") if a winning line is found,
  #                         or false if there is no winner yet
  #
  # Explanation:
  # This method iterates through each possible winning combination.
  # For each line, it checks if all three positions contain the same marker and are not empty.
  # If such a line is found, it returns the marker symbol that won.
  # If no winning line is found, it returns false.
  def winner?
    # Check each line for all identical markers (not empty)
    win_combinations.each do |line|
      return line.first if line.uniq.length == 1 && line.first != ' '
    end
    false
  end

  # Check if the board is full (no empty spaces)
  #
  # @return [Boolean] returns true if all cells are filled (no spaces),
  #                   false if there is at least one empty cell
  #
  # Explanation:
  # This method flattens the 2D grid into a 1D array and checks if none of the elements are spaces.
  # If no spaces remain, the board is full and the game is a draw if no winner.
  def full?
    @grid.flatten.none?(' ')
  end
end
