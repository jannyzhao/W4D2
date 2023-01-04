require 'byebug'
require_relative 'pawn'
require_relative 'king'
require_relative 'rook'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'nullpiece'



class Board
    attr_reader :board
    def initialize

        @board = Array.new(8) {Array.new(8)}
        place_pieces

    end

    def print_board
        board_of_symbols = @board.map do |row|
             row.map {|ele| ele.symbol}
        end

        board_of_symbols.each do |row|
            puts row.join(" ")
        end
        nil
    end


    def place_pieces
        @board.each_with_index do |row, i|
            if i == 1 || i == 6
                (0..7).each do |col|
                    if i == 1
                        @board[i][col] = Pawn.new("black", @board, [i,col])
                    else
                        @board[i][col] = Pawn.new("white", @board, [i,col])
                    end
                end
            end

            if (2..5).include?(i)
                (0..7).each do |col|
                    @board[i][col] = NullPiece.instance
                end
            end

            if i == 0
                (0..7).each do |col|
                    if col == 0 || col == 7
                        @board[i][col] = Rook.new("black", @board, [i,col])
                    end

                    if col == 1 || col == 6
                        @board[i][col] = Knight.new("black", @board, [i,col])
                    end

                    if col == 2 || col == 5
                        @board[i][col] = Bishop.new("black", @board, [i,col])
                    end

                    if col == 3
                        @board[i][col] = Queen.new("black", @board, [i,col])
                    end

                    if col == 4
                        @board[i][col] = King.new("black", @board, [i,col])
                    end
                end
            elsif i == 7
                (0..7).each do |col|
                    if col == 0 || col == 7
                        @board[i][col] = Rook.new("white", @board, [i,col])
                    end

                    if col == 1 || col == 6
                        @board[i][col] = Knight.new("white", @board, [i,col])
                    end

                    if col == 2 || col == 5
                        @board[i][col] = Bishop.new("white", @board, [i,col])
                    end

                    if col == 3
                        @board[i][col] = King.new("white", @board, [i,col])
                    end

                    if col == 4
                        @board[i][col] = Queen.new("white", @board, [i,col])
                    end
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @board[row][col] = val
    end

    def move_piece(start_pos, end_pos, color)

        if self[start_pos] == NullPiece.instance || !valid_pos?(end_pos) || self[start_pos].color == self[end_pos].color
            raise "Cannot move there"
        end
        if !self[start_pos].moves.include?(end_pos)
            raise "Cannot move there"
        end
        start_piece = self[start_pos]
        end_piece = self[end_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos] = start_piece
    end

    def valid_pos?(pos)
        pos.all? { |rowcol| rowcol.between?(0,7) }
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)
    end


    def in_check?(color)
    end

    def find_king(color)

    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end
end
