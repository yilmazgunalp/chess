# CREATE THE PIECES
require './moves.rb'
class Piece
  include Moves
  attr_accessor :color, :type, :position, :is_alive
  def initialize color, type, position=nil 
    @color = color
    @type = type
    @is_alive = true
    @position = position
    end 
  def opponent? other_piece
  @color != other_piece.color ? true : false
  end  
    
  def to_s 
    if @color == :black
    case @type
    when :king  then "\u{265A}"
    when :queen  then "\u{265B}"
    when :rook  then "\u{265C}"
    when :bishop  then "\u{265D}"
    when :knight  then "\u{265E}"  
    when :pawn  then "\u{265F}"
    end
    elsif  @color == :white
    case @type
    when :king  then "\u{2654}"
    when :queen  then "\u{2655}"
    when :rook  then "\u{2656}"
    when :bishop  then "\u{2657}"
    when :knight  then "\u{2658}"  
    when :pawn  then "\u{2659}"
    end
    end
    end
    

def move dest, board
  if possible_moves(board).include?(dest)
  board.remove self  
  @position = dest
  board.place self
  else 
  return false 
  end
end

def possible_moves b
  y = @position[0] 
  x = @position[1]
  possible_moves = [] 
  
  case @type
  when :pawn
  possible_moves = pawn_moves(y,x,b)
  when :rook
  possible_moves = lateral_moves(y,x,b)
  when :bishop
  possible_moves = diagonal_moves(y,x,b)
  when :queen
  possible_moves += diagonal_moves(y,x,b)
  possible_moves += lateral_moves(y,x,b)
  when :king
  possible_moves = king_moves(y,x,b)
  when :knight
  possible_moves = knight_moves(y,x,b)  
  end
  possible_moves
  end  
  


  
end 


