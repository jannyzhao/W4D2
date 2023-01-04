require_relative "piece"
require "singleton"



class NullPiece < Piece

    include Singleton
    def initialize
        @symbol = :N
    end

    def symbol
        @symbol
    end

    def moves
        nil
    end
end
