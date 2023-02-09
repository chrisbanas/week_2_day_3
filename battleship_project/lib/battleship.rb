require_relative "board"
require_relative "player"

class Battleship

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

# getter methods

    def board
        @board
    end

    def player
        @player
    end

# other methods

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            puts "you lose"
            return false
        end
    end

    def game_over?
        if self.win? == true && self.lose? == false
            return true
        elsif self.win? == false && self.lose? == true
            return true
        elsif self.win? == true && self.lose? == true
            return true
        else
            return false
        end
    end

    def turn

        move = self.player.get_move
        puts @board.print

        if self.board.attack(move) == false
            self.board.attack(move)
            @remaining_misses -= 1
            puts @remaining_misses
        end

    end


end
