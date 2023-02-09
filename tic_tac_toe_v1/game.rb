require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_mark, player_2_mark)
        @p_1_mark = HumanPlayer.new(player_1_mark)
        @p_2_mark = HumanPlayer.new(player_2_mark)
        @c_player = @p_1_mark
        @board = Board.new
    end

    def switch_turn
        if @c_player == @p_1_mark
            @c_player = @p_2_mark
        elsif @c_player == @p_2_mark
            @c_player = @p_1_mark
        end
    end

    def play

        while @board.empty_positions? == true
            @board.print
            position = @c_player.get_position
            @board.place_mark(position, @c_player.mark)

           if @board.win?(@c_player.mark) == true
                puts 'Game Over'
                puts "Player " + @c_player.mark.to_s + " victory!"
                return
           else
                switch_turn
           end
        end
        puts 'Game Over'
        puts "Draw!"
    end

end
