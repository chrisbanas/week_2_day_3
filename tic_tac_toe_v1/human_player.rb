class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        # begin
        puts "Player " + self.mark.to_s + ", enter a position with coordinates separated with a space like `4 7`"
        coordinates = gets.chomp
        position = coordinates.split(" ").map { |num| num.to_i }

        if !(position.length == 2)
            raise "Please enter only numbers in the correct format!"
        elsif !(position[0].integer?) || !(position[1].integer?)
            raise "Please enter only numbers in the correct format!"
        end

        # rescue
        #      retry
        # end

        position
    end

end

if $PROGRAM_NAME == __FILE__
    b = HumanPlayer.new(:X)
    b.get_position

end
