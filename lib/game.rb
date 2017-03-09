class Game
#  SET THE BOARD 
def self.set_game
  black = []
  white = []
  black_pawns = []
  white_pawns = []
  black << Piece.new(:black,:rook)
    black << Piece.new(:black,:knight)
    black << Piece.new(:black,:bishop)
    black << Piece.new(:black,:queen)
    black << Piece.new(:black,:king)
    black << Piece.new(:black,:bishop)
    black << Piece.new(:black,:knight)
    black << Piece.new(:black,:rook)
    white << Piece.new(:white,:rook)
    white << Piece.new(:white,:knight)
    white << Piece.new(:white,:bishop)
    white << Piece.new(:white,:queen)
    white << Piece.new(:white,:king)
    white << Piece.new(:white,:bishop)
    white << Piece.new(:white,:knight)
    white << Piece.new(:white,:rook)
    8.times do 
  black_pawns << Piece.new(:black,:pawn) 
  white_pawns << Piece.new(:white,:pawn) 
  end
  
  Board.board[0] = black
  Board.board[1] = black_pawns
  Board.board[6] = white_pawns
  Board.board[7] = white
  Board.draw
  nil
  end
end