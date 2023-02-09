class Player

    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        coordinates = gets.chomp
        coordinates.split(" ").map { |num| num.to_i }
    end

end
