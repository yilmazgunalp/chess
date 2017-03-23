class Game
#  SET THE BOARD 
def self.set_game
  black = []
  white = []
  black_pawns = []
  white_pawns = []
  black << Piece.new(:black,:rook,[0,0])
    black << Piece.new(:black,:knight,[0,1])
    black << Piece.new(:black,:bishop,[0,2])
    black << Piece.new(:black,:queen,[0,3])
    black << Piece.new(:black,:king,[0,4])
    black << Piece.new(:black,:bishop,[0,5])
    black << Piece.new(:black,:knight,[0,6])
    black << Piece.new(:black,:rook,[0,7])
    white << Piece.new(:white,:rook,[7,0])
    white << Piece.new(:white,:knight,[7,1])
    white << Piece.new(:white,:bishop,[7,2])
    white << Piece.new(:white,:queen,[7,3])
    white << Piece.new(:white,:king,[7,4])
    white << Piece.new(:white,:bishop,[7,5])
    white << Piece.new(:white,:knight,[7,6])
    white << Piece.new(:white,:rook,[7,7])
    i=0
    8.times do 
    black_pawns << Piece.new(:black,:pawn,[1,i]) 
    white_pawns << Piece.new(:white,:pawn,[6,i])
    i += 1
  end
  
  Board.board[0] = black
  Board.board[1] = black_pawns
  Board.board[6] = white_pawns
  Board.board[7] = white
  Board.draw
  nil
  end
end