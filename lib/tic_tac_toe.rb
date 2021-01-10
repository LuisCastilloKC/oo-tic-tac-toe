class TicTacToe

    def initialize
        @board = Array.new(9, " ") 
    end

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5],
        [6,7,8],
        [6,4,2],
        [0,4,8],
        [0,3,6],
        [1,4,7],
        [2,5,8]]
        
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(string)
       @choose = string.to_i-1
    end
    
    def move(index, current_player = "X")
        @board[index] = current_player
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        turn = 0
        @board.each do |index|
          if index == "X" || index == "O"
            turn += 1
          end
        end
        return turn
    end

    def current_player
        num_turns = turn_count
        if num_turns % 2 == 0
          player = "X"
        else
          player = "O"
        end
        return player
    end

    def turn
        puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
          player_token = current_player
          move(index, player_token)
          display_board
        else
          turn
        end
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
          index_0 = win_combo[0]
          index_1 = win_combo[1]
          index_2 = win_combo[2]
      
          position_1 = @board[index_0]
          position_2 = @board[index_1]
          position_3 = @board[index_2]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          end
        }
        return false
      end

      def full?
        @board.all? {|index| index == "X" || index == "O"}
      end

      def draw?
        if !won? && full?
          return true
        else
          return false
        end
      end

      def over?
        if won? || draw?
          return true
        else
          return false
        end
      end

      def winner
        index = []
        index = won?
        if index == false
          return nil
        else
          if @board[index[0]] == "X"
            return "X"
          else
            return "O"
          end
        end
      end

      def play
        until over? == true
          turn
     end

     if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
    
end


# ./lib/tic_tac_toe.rb
#   TicTacToe
#     #initialize
#       assigns an instance variable @board to an array with 9 blank spaces " "
#     WIN_COMBINATIONS
#       defines a constant WIN_COMBINATIONS with arrays for each win combination
#     #display_board
#       prints arbitrary arrangements of the board
#     #input_to_index
#       accepts the user's input (a string) as an argument
#       converts the user's input (a string) into an integer
#       converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)
#     #move
#       allows "X" player in the top left and "O" in the middle
#     #position_taken?
#       returns true/false based on whether the position on the board is already occupied
#     #valid_move?
#       returns true/false based on whether the position is already occupied
#       checks that the attempted move is within the bounds of the game board
#     #turn_count
#       counts occupied positions
#     #current_player
#       returns the correct player, X, for the third move
#       returns the correct player, O, for the fourth move
#     #turn
#       receives user input via the gets method
#       calls #input_to_index, #valid_move?, and #current_player
#       makes valid moves and displays the board
#       asks for input again after a failed validation
#     #won?
#       returns false for a draw
#       returns the winning combo for a win
#     #full?
#       returns true for a draw
#       returns false for an in-progress game
#     #draw?
#       returns true for a draw
#       returns false for a won game
#       returns false for an in-progress game
#     #over?
#       returns true for a draw
#       returns true for a won game
#       returns false for an in-progress game
#     #winner
#       return X when X won
#       returns O when O won
#       returns nil when no winner

# ./lib/tic_tac_toe.rb
#   TicTacToe
#     #play
#       asks for players input on a turn of the game
#       checks if the game is over after every turn
#       plays the first turn of the game
#       plays the first few turns of the game
#       checks if the game is won after every turn
#       checks if the game is draw after every turn
#       stops playing if someone has won
#       congratulates the winner X
#       congratulates the winner O
#       stops playing in a draw
#       prints "Cat's Game!" on a draw
#       plays through an entire game

# bin/tictactoe
#   instantiates an instance of TicTacToe
#   calls #play on the instance of TicTacToe

# Finished in 0.13726 seconds (files took 0.10208 seconds to load)
# 44 examples, 0 failures