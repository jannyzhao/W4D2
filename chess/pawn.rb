require_relative "piece"
require_relative "slideable"
require 'colorize'
require 'byebug'

class Pawn < Piece

    def symbol
        '♙'.chomp
    end

    def moves
        # if the position is a null piece
        possible = []
        # debugger
        forward = forward_dir
        forward_s = forward_steps
        debugger
        if @board[forward].symbol == :N && @board[forward_s].symbol == :N
            possible << forward
            possible << forward_s
            possible += side_attacks
        elsif @board[[forward]].symbol == :N && @board[[forward_s]].symbol != :N
            possible << forward
            possible += side_attacks
        else
            return side_attacks
        end
        possible
    end

    private
    def at_start_row?
        if self.color == 'white'
            return true if self.pos[0] == 6
        elsif self.color == 'black'
            return true if self.pos[0] == 1
        end
        false
    end

    def forward_dir
        row , col = pos
        if self.color == 'black'
            row2 = row + 1
            pos2 = [row2, col]
            return [1,0]
        else
            return [-1,0]
        end
    end

    def forward_steps
        if self.color == 'black' && at_start_row?
            return [-2,0]
        end

        if self.color == 'white' && at_start_row?
            return [2, 0]
        end

    end

    def side_attacks
        self_x, self_y = self.pos
        possible_moves = []
        if self.color == 'black'
            diagonal_x1 = self_x - 1
            diagonal_y1 = self_y + 1
            diagonal_y2 = self_y - 1
            diag_pos1 = [diagonal_x1, diagonal_y1]
            diag_pos2 = [diagonal_x1, diagonal_y2]
            possible_moves << diag_pos1 if @board[diag_pos1].color == 'white'
            possible_moves << diag_pos2 if @board[diag_pos1].color == 'white'
        elsif self.color == 'white'
            diagonal_x1 = self_x + 1
            diagonal_y1 = self_y + 1
            diagonal_y2 = self_y - 1
            diag_pos1 = [diagonal_x1, diagonal_y1]
            diag_pos2 = [diagonal_x1, diagonal_y2]
            possible_moves << diag_pos1 if @board[diag_pos1].color == 'black'
            possible_moves << diag_pos2 if @board[diag_pos1].color == 'black'
        end
        possible_moves
    end
end
