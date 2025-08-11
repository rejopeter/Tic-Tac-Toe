# Tic-Tac-Toe
## Prerequisites
- Ruby 2.7.x or Ruby 3.x 
- Terminal or command line access
## Installation
1. Clone the repo: [Tic-Tac-Toe](https://github.com/rejopeter/Tic-Tac-Toe.git)
2. Navigate to the project directory: `cd Tic-Tac-Toe`
3. Run the game: `ruby main.rb`
## Overview
This is a classic Tic-Tac-Toe game implemented in Ruby. The game supports two human players taking turns to mark spaces in a 3×3 grid. Players take turns placing their marks on the board. The first to place three marks in a horizontal, vertical, or diagonal line wins. If all squares are filled without a winner, the game ends in a draw.
---
## Project Structure

- `lib/`  
  Contains core Ruby files: `player.rb`, `board.rb`, and `game.rb`.

- `Gemfile`  
  Manages gem dependencies.

- `.rubocop.yml`  
  Custom RuboCop rules for consistent code style.

- `README.md`  
  Project documentation.
---
## Files and Their Responsibilities
### 1. `main.rb`
- Entry point of the game.
- Handles player setup and input for unique player names.
- Creates player instances and the game board.
- Initializes the game controller (`Game` class) and starts the game loop.
### 2. `player.rb`
- Defines the `Player` class.
- Stores player-specific data like name and marker (`X` or `O`).
- Provides a method to display player info.
### 3. `board.rb`
- Defines the `Board` class.
- Maintains the 3×3 game grid.
- Displays the current state of the board.
- Handles updating the board with player moves.
- Checks for winning conditions and whether the board is full (draw).
### 4. `game.rb`
- Defines the `Game` class.
- Contains the main game loop.
- Manages turns between players.
- Validates moves and updates the board accordingly.
- Checks for win or draw after each move.
- Announces the game outcome.
- Controls switching between players.
---
## How the Game Works (Flow)
1. **Player Setup:**  
   The program prompts each player to enter their names, ensuring both names are non-empty and unique.
2. **Game Initialization:**  
   Player objects are created with assigned markers (`X` for Player 1 and `O` for Player 2). A fresh game board is initialized.
3. **Gameplay Loop:**  
   - The board is displayed with current markings.  
   - The current player is prompted to choose a position (1-9) on the board.  
   - Input is validated to be in range and for the chosen cell to be empty.  
   - The board updates with the player's marker at the chosen position.  
   - The game checks if this move causes the player to win or if the board is full (draw).  
   - If the game ends, the winner or draw is announced; otherwise, the turn switches to the other player.
---
## Input and Output Details
- **Player Input:**  
  Players enter their names initially and choose board positions by entering numbers 1 through 9 corresponding to board cells:
| 1 | 2 | 3 |
|---|---|---|
| 4 | 5 | 6 |
| 7 | 8 | 9 |
- **Game Output:**  
  - Displays current board state after every move.  
  - Displays error messages on invalid input or occupied cells.  
  - Announces winner or declares a draw.
---
## Key Design Choices
- **Modular Design:** Each class has a clear responsibility to separate concerns and ease future maintenance.  
- **Traditional Board Indexing:** Players select positions using a 1-9 keypad style mapping for intuitive input.  
- **Turn-based Play:** Alternates players after each valid move.  
- **Input Validation:** Ensures inputs are valid and cells are not overwritten, maintaining game integrity.
---
## Future Enhancements (Suggestions)
- Add support for playing against a computer AI.  
- Implement a GUI interface for easier interaction.  
- Add replay or reset functionality after a game ends.  
- Maintain a scoreboard tracking wins, losses, and draws.  
---
## Contributing
Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.