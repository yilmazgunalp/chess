class Board
  @@board = Array.new(8){Array.new(8)}  
  def self.board
    @@board  
    end
   def self.draw
     @@board.each_with_index {|row,i| puts "#{i+1}  #{row.join("  ")}"}
     print "   "
     ("A".."H").each {|l| print "#{l}   "}
     puts
    end
    
    def self.validate_moves ary
      ary.select {|p| @@board[p[0]][p[1]].nil?} 
    end  
end