require_relative 'piece'
require_relative 'stepable'
require 'colorize'


class King < Piece
    include Stepable

    def symbol
        '♕'.chomp
    end

    private
    def move_diffs
        [
            [1,0],
            [0,1],
            [1,1],
            [-1,1] ,
            [-1,-1],
            [1,-1],
            [0,-1],
            [-1,0]
        ]
    end
end
