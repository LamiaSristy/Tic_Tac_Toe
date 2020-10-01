require_relative 'player.rb'

class BoardGame
    def initialize(player1, player2)
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        @player1=player1
        @player2=player2
    end

    def display_board
        puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts ' ---+---+---'
        puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts ' ---+---+--- '
        puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end


    def position_taken?(input)
      @board[input] == 'X' || @board[input] == 'O'
    end
    
    def valid_move?(input)
      input.between?(0, 8) && !position_taken?(input)
    end

    def turn
        if @turn_count.odd?  
            @current_player = @player1
        else 
            @current_player = @player2 
        end
        puts "#{@current_player.name}, Please choose a number between 1-9"
        position = gets.chomp.to_i
        position = position-1
        if valid_move?(position)
            @board[position]=@current_player.sign
        else
            puts "invalid position or input"
            turn
        end

        display_board
    end


    def play
        @turn_count=0
        until over?
            @turn_count+=1
            turn            
        end
        puts ' Game Over'

        if won?
            puts "#{@current_player.name} has won"
        else
            puts 'Its a draw'
        end
    end

end

class TicTacToe < BoardGame
    # start: game logic
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [6, 4, 2],
        [0, 4, 8]
      ]

    def draw?
        !won? && full?
    end

    def full?
        @turn_count == 9
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
        end
    end

    def over?
        won? || full? || draw?
    end

# end: game logic
end