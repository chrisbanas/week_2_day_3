class Board

    def initialize
        @board = Array.new(3) { Array.new(3, "_")}
    end

    def valid?(position) # [row, col]
        r, c = position

        if r > @board.length - 1 || c > @board.length - 1 || r < 0 || c < 0
            raise puts "invalid mark"
            return false
        else
            return true
        end

    end

    def empty?(position) # [row, col]
        r, c = position
        @board[r][c] == "_" ? true : false
    end

    def place_mark(position, mark) # [row, col] , ":O"
        r, c = position
        if self.valid?(position) && self.empty?(position)
            @board[r][c] = mark
        else
            raise puts "Cannot play that space!"
        end
    end

    # This seems to be the only way to get the board to print correctly is to first set a call method that calls itself and creates the pretty look then to call it below that to print the new pretty look.
    def self.print(grid)
        grid.each { |row| puts row.join(" ") }
    end

    def print
        Board.print(@board)
    end

    def win_row?(mark)

        @board.each { |row| return true if row.all? { |ele| ele == mark } }
        false

    end

    def win_col?(mark)

        @board.transpose.each { |row| return true if row.all? { |ele| ele == mark } }
        false

    end

    #took this code from nauseating numbers

    def win_diagonal?(mark)

        left = (0...@board.length).all? { |i| @board[i][i] == mark }

        right = (0...@board.length).all? { |i| @board[i][@board.length - 1 - i] == mark }
        
        left || right

    end

    def win?(mark)
        # return true if win_diagonal?(mark) == true || win_col?(mark) == true || win_row?(mark) == true
        # false
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        empty = 0
        @board.each { |row| empty += row.count("_") }
        empty > 0 ? true : false
    end

end


if $PROGRAM_NAME == __FILE__
    b = Board.new
    b.place_mark([0, 0], :X)
    b.place_mark([1, 1], :X)
    b.place_mark([2, 2], :X)
    p b.print
    p b.win_diagonal?(:X)
    p b.win?(:X)
end
