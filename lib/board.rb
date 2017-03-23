# CREATE THE BOARD
class Board
  
  class PlaceHolder
  attr_accessor :color
  def initialize
    @color = nil
  end  
  def to_s
    "  "
  end  
    
  end  
  
  @@board = Array.new(8){Array.new(8){PlaceHolder.new}}  
  def self.board *args
    if args.length == 0
    @@board 
    else
     @@board[args[0]][args[1]] 
    end  
    end
   def self.draw
     @@board.each_with_index {|row,i| puts "#{i+1}  #{row.join("  ")}"}
     print "   "
     ("A".."H").each {|l| print "#{l}   "}
     puts
     puts
    end
    
    def self.place piece 
      @@board[piece.position[0]][piece.position[1]] = piece
    end
    
    def self.remove piece
      @@board[piece.position[0]][piece.position[1]] = PlaceHolder.new
    end 
  
  
    
end