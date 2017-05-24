module Moves
  
def pawn_moves y,x,b
  possible_moves = [] 
  if @color == :white 
  if y == 6 
  possible_moves << [4,x]  if  b.board(y-1,x).class == Board::PlaceHolder &&  b.board(4,x).class == Board::PlaceHolder 
  end   
  possible_moves << [y-1,x] if  b.board[y-1][x].class == Board::PlaceHolder
  possible_moves << [y-1,x-1] if !b.board(y-1,x-1).color &&  b.board(y-1,x-1).color == :black
  possible_moves << [y-1,x+1] if !b.board(y-1,x+1).color.nil? &&  b.board(y-1,x+1).color == :black
  end  
  
  if @color == :black 
  if y == 1 
  possible_moves << [3,x]  if b.board(y+1,x).class == Board::PlaceHolder && b.board(3,x).class == Board::PlaceHolder 
  end   
  possible_moves << [y+1,x] if b.board(y+1,x).class == Board::PlaceHolder
  possible_moves << [y+1,x-1] if !b.board(y+1,x-1).color && b.board(y+1,x-1).color == :white
  possible_moves << [y+1,x+1] if !b.board(y+1,x+1).color.nil? && b.board(y+1,x+1).color == :white
  end  
  possible_moves
  end  
  
def lateral_moves y,x,b
  yy = y
  xx = x
  results = []
  
  while   xx < 7 
  if b.board(yy,xx+1).class == Board::PlaceHolder
  results << [yy,xx+1]
  elsif opponent?(b.board(yy,xx+1))
  results << [yy,xx+1]
  break
  else
  break  
  end
  xx += 1
  end
  
  xx = x
  while   xx > 0 
  if b.board(yy,xx-1).class == Board::PlaceHolder
  results << [yy,xx-1]
  elsif opponent?(b.board(yy,xx-1))
  results << [yy,xx-1]
  break
  else
  break
  end
  xx -= 1
  end
  
  
  xx = x
  while   yy < 7
  if b.board(yy+1,xx).class == Board::PlaceHolder
  results << [yy+1,xx]
  elsif opponent?(b.board(yy+1,xx))
  results << [yy+1,xx]
  break
  else
  break  
  end
  yy += 1
  end
  
  yy = y 
  while   yy > 0
  if b.board(yy-1,xx).class == Board::PlaceHolder
  results << [yy-1,xx]
  elsif opponent?(b.board(yy-1,xx))
  results << [yy-1,xx]
  break
  else
  break  
  end
  yy -= 1
  end
  results
  end  

def diagonal_moves y,x,b
  yy = y
  xx = x
  results = []
  while   yy > 0 && xx < 7 
  if b.board(yy-1,xx+1).class == Board::PlaceHolder
  results << [yy-1,xx+1]
  elsif opponent?(b.board(yy-1,xx+1))
  results << [yy-1,xx+1]
  break
  else
  break  
  end
  yy -= 1
  xx += 1
  end
  
  yy = y
  xx = x
  while   yy > 0 && xx > 0
  if b.board(yy-1,xx-1).class == Board::PlaceHolder
  results << [yy-1,xx-1]
  elsif opponent?(b.board(yy-1,xx-1))
  results << [yy-1,xx-1]
  break
  else
  break  
  end
  yy -= 1
  xx -= 1
  end
  
  yy = y
  xx = x
  while   yy < 7 && xx > 0
  if b.board(yy+1,xx-1).class == Board::PlaceHolder
  results << [yy+1,xx-1]
  elsif opponent?(b.board(yy+1,xx-1))
  results << [yy+1,xx-1]
  break
  else
  break  
  end
  yy += 1
  xx -= 1
  end
  
  yy = y
  xx = x
  while   yy < 7 && xx < 7
  if b.board(yy+1,xx+1).class == Board::PlaceHolder
  results << [yy+1,xx+1]
  elsif opponent?(b.board(yy+1,xx+1))
  results << [yy+1,xx+1]
  break
  else
  break  
  end
  yy += 1
  xx += 1
  end
  
  results  
  end

def king_moves y,x,b
  yy = y
  xx = x
  results = []
  moves = [[yy+1,xx+1],[yy-1,xx-1],[yy+1,xx-1],[yy-1,xx+1], [yy,xx-1],[yy,xx+1], [yy+1,xx],[yy-1,xx]]
  results = moves.select do |move| 
  if  move[0].between?(0,7)  &&  move[1].between?(0,7)
  b.board(move[0],move[1]).class == Board::PlaceHolder || self.opponent?(b.board(move[0],move[1]))
  end  
  end
  results 
  end

def knight_moves y,x,b
  yy = y
  xx = x
  results = []
  moves = [[yy-2,xx+1],[yy-2,xx-1],[yy+2,xx-1],[yy+2,xx+1], [yy-1,xx+2],[yy+1,xx+2], [yy+1,xx-2],[yy-1,xx-2]]
  results = moves.select do |move| 
  if  move[0].between?(0,7)  &&  move[1].between?(0,7)
  b.board(move[0],move[1]).class == Board::PlaceHolder || self.opponent?(b.board(move[0],move[1]))
  end  
  end
  results 
  end
 
def check b
attackers = []
attackers += lateral_moves(@position[0],@position[1],b)
attackers += diagonal_moves(@position[0],@position[1],b)
attackers += knight_moves(@position[0],@position[1],b)
attackers.select! {|sqr| b.board(sqr[0],sqr[1]).class != Board::PlaceHolder }
attackers.any? {|sqr| b.board(sqr[0],sqr[1]).possible_moves(b).include?(@position)} ? true : false
end  



end  