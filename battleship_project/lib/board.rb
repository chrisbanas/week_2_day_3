class Board

    def initialize(n)
        @grid = Array.new(n,:N) {Array.new(n,:N)}
        @size = n * n
    end

# getter method

    def size
        @size
    end

    def [](indices) #[row, column] - is a getter method because it displays values
        @grid[indices[0]][indices[1]]
    end

#setter method

    def []=(position, value)
        @grid[position[0]][position[1]] = value
        return @grid[position[0]][position[1]]
    end

    def num_ships
        count = 0
        @grid.each { |sub_arr| count += sub_arr.count(:S) }
        count
    end

    def attack(position)
        if self.[](position) == :S
            # @grid[position[0]][position[1]] == :S
            self.[]=(position, :H)
            # @grid[position[0]][position[1]] = :H
            puts "you sunk my battleship!"
            return true
        else
            self.[]=(position, :X)
            # @grid[position[0]][position[1]] = :X
            return false
        end
    end

    def place_random_ships
        quater = size * 0.25
        x = Integer.sqrt(size)
        while self.num_ships < quater.to_i
            row = rand(0...x)
            col = rand(0...x)
            self[[row, col]] = :S
            # @grid.map.with_index! { |sub_arr, i| sub_arr[i][rand(0...x)] == :S }
        end
    end

    def hidden_ships_grid
        x = Integer.sqrt(size)
        new_arr = Array.new(x) {Array.new(x)}
       @grid.each_with_index do |sub_arr, i_1|
            sub_arr.each_with_index do |ele, i_2|
                if ele == :S
                    new_arr[i_1][i_2] = :N
                else
                    new_arr[i_1][i_2] = ele
                end
            end
        end
        new_arr
    end

    def self.print_grid(grid) # class method
        grid.each { |row| puts row.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)  # self. did not work. I had to change it to Board
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
