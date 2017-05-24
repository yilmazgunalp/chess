require './piece.rb'
require './board.rb'
require './helper.rb'

class Game

Player = Struct.new(:color,:opponent)  

attr_accessor :player1, :player2, :board

def initialize 
@player1,@player2 = Player.new(:white, :black),Player.new(:black, :white)  
@board = Board.new
set_game
end  
  
#  SET THE BOARD 
def set_game
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
  
  @board.board[0] = black
  @board.board[1] = black_pawns
  @board.board[6] = white_pawns
  @board.board[7] = white
  @board.white_king = @board.board(7,4)
  @board.black_king = @board.board(0,4)
  @board.draw
  nil
  end
  
  
def self.start 
  
game = Game.new  

player = game.player1
check = false
while true 
puts "#{player.color} enter your move as A7 A6"
choice = move(gets.chomp!.downcase)

piece = game.board.board(choice[0][0],choice[0][1])
dest = game.board.board(choice[1][0],choice[1][1])

if piece.color == player.color && piece.move(choice[1], game.board)
piece.move choice[1], game.board
  # This if statement checks for invali move of putting player's own king in risk and reverses the move
  if game.board.get_king(player.color).check(game.board)
  puts "You CAN'T put king in risk"
  game.board.remove piece
  piece.position = choice[0]
  game.board.place piece
  redo
  end  
game.board.draw
if game.board.get_king(player.opponent).check(game.board)
check = true
puts "CHECK!"
end #if for check  

player == game.player1 ? player = game.player2 : player = game.player1
else 
puts "Enter a valid move"  

end #if for valid move  




end  # end while



end  # end start()


  
  
end #end Game 