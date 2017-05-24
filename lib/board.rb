# CREATE THE BOARD
class Board
  
  class PlaceHolder
  attr_accessor :color
  def initialize
    @color = nil
  end  
  def to_s
    " "
  end  
    
  end  
  
  attr_accessor :white_king , :black_king
   
  def initialize 
  @board =  Array.new(8){Array.new(8){PlaceHolder.new}} 
  @white_king = nil 
  @black_king = nil
  end  
  
  def board *args
    if args.length == 0
    @board 
    else
     @board[args[0]][args[1]] 
    end  
    end
   def draw
     @board.each_with_index {|row,i| puts "#{i+1}  #{row.join("  ")}"}
     print "   "
     ("A".."H").each {|l| print "#{l}  "}
     puts
     puts
    end
    
    def place piece 
      @board[piece.position[0]][piece.position[1]] = piece
    end
    
    def remove piece
      @board[piece.position[0]][piece.position[1]] = PlaceHolder.new
    end 
  
  
  def get_king color 
  if color == :white
  @white_king
  else
  @black_king  
  end
  end  
  
    
end