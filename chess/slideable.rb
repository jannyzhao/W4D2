require 'byebug'
module Slideable
    HORIZONTAL_DIRS =
        [
            [0,1],
            [0,-1],
            [1,0],
            [-1,0]
        ].freeze

    DIAGONAL_DIRS =
    [
        [1,1],
        [1,-1],
        [-1,-1],
        [-1,1]
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        #return all the possible moves (2d array) that a piece can move to
        possible_moves = []
        dirs = self.move_dirs
        dirs.each do |dir|
            dx = dir[0]
            dy = dir[1]
            possible_moves += grow_unblocked_moves_in_dir(dx,dy)
        end
        possible_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)

        #create an array to collect moves
        # get the piece's current row and current column
        #

        #in a loop:
            #continually increment the piece's current row and current column to generate a new positions
            ##stop looping if the new pos is invalid (not on the board)
            # stop looping if the piece can't move in this dir
            #if the new pos is empty, the piece can move here , so add the new pos to the moves array
            #if new pos is occupied with a poiece of the opp color, the piece can ove here (capture the opponet, but piece cannot move past this piece, so stop looping)


            #return

        start_x, start_y = self.pos
        moves_arr = []
        debugger
        #get into the loop
        until start_x < 0 || start_x > 7 || start_y < 0 || start_y > 7

            start_x += dx
            start_y += dy
            #break out of the loop if after one iteration we are out of bounds
            break if start_x < 0 || start_x > 7 || start_y < 0 || start_y > 7

            #if the new pos is occoupied with a piece of the smae color, stop loop
            break if self.color == @board[[start_x, start_y]].color
            moves_arr << [start_x, start_y]

            break if (self.color != @board[[start_x, start_y]].color) && (@board[[start_x, start_y]] != nil)
        end
        moves_arr
    end

end
