module Stepable
        #create array to collect moves
        #for each move_diff, increment the piece's position to generate a new position
        #add the new position to the moves array if it is:
        # on the board and empty
        # OR on the board and contains a piece of the opposite color
        #returns a 2d array of the final array of moves

    def moves
        possible_moves = []
        self.move_diffs.each do |moves|
            dx, dy = moves
            x, y = self.pos

            new_x = x + dx
            new_y = y + dy
            new_pos = [new_x, new_y]

            if @board.valid_pos?(new_pos)
                possible_moves << new_pos
            end
        end
        possible_moves
    end

    private
    def move_diffs

    end
end
