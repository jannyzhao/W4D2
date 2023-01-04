require_relative 'piece'
require_relative 'slideable'
require 'colorize'


class Bishop < Piece
    include Slideable

    def symbol
        "♗".chomp
        # .colorize(color)
    end

    private
    def move_dirs
        diagonal_dirs
    end
end
