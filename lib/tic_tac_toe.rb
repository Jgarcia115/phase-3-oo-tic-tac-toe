class TicTacToe
    def initialize
        @board= [" "," "," ",
                " "," "," ",
                " "," "," "]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def input_to_index(str)
        int = str.to_i
        int-1
    end

    def move(choice, token="X")
        @board[choice] = token 
    end

    def position_taken?(index)
        if (@board[index] == "X" || @board[index] == "O")
            return true
        else 
            return false
        end
    end

    def valid_move?(index)
        if (@board[index] == " " && index >= 0 && index <= 8)
            return true
        else 
            return false
        end
    end

    def turn_count
        moves = 9 - @board.count(" ")
        return moves

    end

    def current_player
        if (@board.count("O") < @board.count("X"))
            return "O"
        else
            return "X"
        end
    end

    def turn
        num = gets.strip
        
        choice = self.input_to_index(num)
        if (self.valid_move?(choice))
            token = self.current_player
            self.move(choice, token)
            self.display_board
        else
            turn
        end
    end

    def won
        if (@board = WIN_COMBINATIONS)
            self.display_board
        else
            return false
        end
    end


end