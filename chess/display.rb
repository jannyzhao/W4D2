require "colorize"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @board.render
    end


    def render
        new_board = @board.dup
        (0...@board.length).each do |row|
            (0...@board.length).each do |col|
                @board[row][col].symbol

    end
end
