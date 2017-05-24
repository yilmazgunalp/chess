def move choice
piece = []
dest = []
origin, target =  choice.split[0], choice.split[1] 
piece <<  origin.split(//)[1].to_i - 1 
('a'..'h').to_a.each_with_index {|l,i| piece << i if l == origin.split(//)[0]  }
dest <<  target.split(//)[1].to_i - 1
('a'..'h').to_a.each_with_index {|l,i| dest << i if l == target.split(//)[0]  }
[piece,dest]
end  

def enemy_king piece,board 
  
  
  
  
end  