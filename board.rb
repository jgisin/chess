class Board

#Set board dimensions and accessors
	  def initialize
    @board = {     1 => [(1..8).to_a],
			 	   2 => [(1..8).to_a],
			 	   3 => [(1..8).to_a],
			 	   4 => [(1..8).to_a],
			 	   5 => [(1..8).to_a],
			 	   6 => [(1..8).to_a],
			 	   7 => [(1..8).to_a],
			 	   8 => [(1..8).to_a]
			 	}
  end

#Accessors for boards
    attr_reader :board
    attr_reader :color

def valid_coord(end_row, end_column)
	if (end_row < 9 && end_row > 0) && (end_column < 9 && end_column >= 0)
		return true
	else
		return false
		puts "invalid coord"
	end
end


#Move function
  def move_piece(piece, end_row, end_column)
  	if valid_coord(end_row, end_column)
	  	if piece.logic(end_row, end_column) && piece.check_collision(self.board, end_row, end_column)
	  	 self.board[end_row][0][end_column] =  self.board[piece.row][0][piece.column]
	  	 self.board[piece.row][0][piece.column] = '_'
	  	 piece.row = end_row
	  	 piece.column = end_column	
		  	 if piece.type == "P"
		  	 	piece.times_moved += 1
		  	 end
	  	else
	  		puts "Invalid Move - Logic/Collision"
	  	end
	 else
	 	puts "Invalid Move - Coord"
	 end
  end

#Display Function
  def display_board
  	puts " -------------------"
  	self.board.each do |key, array|
  		print " | "
        self.board[key][0].each_with_index do |item, index|
	      	if self.board[key][0][index].is_a? Piece
	  			print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '') } "
	  		else
	  			print "#{self.board[key][0][index].to_s.gsub('"', '').gsub(',', '') } "
	  	    end
  		end
  			  		 print "|\n"
  	end
  	puts " -------------------"
  end
end


