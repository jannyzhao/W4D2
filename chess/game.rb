class Board

    def initialize
        @rows = Array.new(8) {Array.new(8,4)}

    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil || !valid_pos?(end_pos)
            raise "Cannot move there"
        end

        start_piece = self[start_pos]
        end_piece = self[end_pos]
        self[start_pos] = nil
        self[end_pos] = start_piece
    end

    def valid_pos?(pos)
        pos.all? { |piece| piece.between?(0,7) }
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
