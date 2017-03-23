require_relative './lib/game.rb'
require_relative './lib/piece.rb'
require_relative './lib/board.rb'


Game.set_game

p = Piece.new(:black, :queen, [4,2])
Board.place p 

Board.remove Board.board[1][5]
Board.remove Board.board[7][1]


(Board.board[6][3]).move [4,3]
(Board.board[4][3]).move [3,3]

Board.board[1][4].move [2,4]

Board.board[3][3].move [2,4]

Board.board(7,0).move [7,1]

r= Piece.new(:white,:rook,[4,0])
Board.place r 
r.move [4,2]
r.move [4,3]
r.move [4,7]
r.move [4,2]



Board.remove Board.board 6,1
Board.board(7,1).move [1,1]
Board.board(7,2).move [2,7]
Board.board(2,7).move [1,6]

Board.board(1,6).move [0,5]

# p Board.board(0,5).possible_moves
q = Board.board 7,3
q.move [1,3]
q.move [1,2]
q.move [0,1]
q.move [5,6]
q.move [4,7]
Board.draw
k = Board.board 0,4
p k.possible_moves
k.move [0,5]

king = Piece.new(:black,:king,[4,0])
p Board.board(0,5).possible_moves
 Board.board(7,6).move [5,5]
Board.draw
p Board.board(5,5).possible_moves
