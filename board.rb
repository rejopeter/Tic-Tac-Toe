#board.rb

# Class to represent the Tic-Tac-Toe board
# Handles board display, updating moves, and checking win/draw conditions
class Board
  def initialize
    # Create a 3x3 grid initialized with spaces representing empty cells
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  # Display the current state of the board on the console
  def display
    puts "\n"
    puts " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} "
    puts "---+---+---"
    puts " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} "
    puts "---+---+---"
    puts " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} "
    puts "\n"
  end

  # Display the numbered board positions for player reference
  def move
    puts "Tic-Tac-Toe"
    puts " 1 | 2 | 3 "
    puts "---+---+---"
    puts " 4 | 5 | 6 "
    puts "---+---+---"
    puts " 7 | 8 | 9 "
    puts "\n"
  end

  # Convert the player's chosen position (1-9) to grid indices (row, col)

  # @param pos [Integer] position from 1 to 9
  # @return [Array<Integer>] row and column indices on the grid
  def position_to_indices(pos)
    pos -= 1       # Convert to zero-based index (0 to 8)
    row = pos / 3  # Integer division to find row
    col = pos % 3  # Modulus to find column
    [row, col]
  end

  # Update the board at the given position with the player's marker if empty

  # @param pos [Integer] position from 1 to 9 where player wants to mark
  # @param marker [String] player's marker symbol (e.g., "X" or "O")
  # @return [Boolean] true if update successful, false if position taken
  def update_board(pos, marker)
    row, col = position_to_indices(pos)

    # Check if cell is empty before placing marker
    if @grid[row][col] == " "
      @grid[row][col] = marker
      true
    else
      puts "Position already taken! Choose another position."
      false
    end
  end

  # Check if there is a winner on the board
  
  # @return [String, nil] returns the winning marker ("X" or "O") or nil if no winner
  def winner?
    # Combine rows, columns (transpose), and diagonals into a single array of lines
    lines = @grid + @grid.transpose +
            [[@grid[0][0], @grid[1][1], @grid[2][2]],
             [@grid[0][2], @grid[1][1], @grid[2][0]]]

    # Check each line for all identical markers (not empty)
    lines.each do |line|
      return line.first if line.uniq.length == 1 && line.first != " "
    end
    nil
  end

  # Check if the board is full (no empty spaces)
  
  # @return [Boolean] true if full, false if any empty cells remain
  def full?
    @grid.flatten.none? { |cell| cell == " " }
  end
end