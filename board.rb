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

    def find_piece(board, row, column)
    	if board.board[row][0][column].is_a? Piece
    		return board.board[row][0][column]
    	end
    end

	def valid_coord(end_row, end_column)
		if (end_row < 9 && end_row > 0) && (end_column < 9 && end_column >= 0)
			return true
		else
			return false
			puts "invalid coord"
		end
	end

	def replace_piece(piece, end_row, end_column)
		 self.board[end_row][0][end_column] =  self.board[piece.row][0][piece.column]
	  	 self.board[piece.row][0][piece.column] = '_'
	  	 piece.row = end_row
	  	 piece.column = end_column	
		  	 if piece.type == "P"
		  	 	piece.times_moved += 1
		  	 end
	end

#Move function
  def move_piece(piece, end_row, end_column)
  	if valid_coord(end_row, end_column)
  		if piece.can_take?(self.board, end_row, end_column)
  		  	replace_piece(piece, end_row, end_column)
		else  
		  	if piece.logic(end_row, end_column) && piece.check_collision(self.board, end_row, end_column)
		  		replace_piece(piece, end_row, end_column)
		  	else
		  		print "Invalid Move - Logic/Collision (#{piece.logic(end_row, end_column)},"
		  		print " #{piece.check_collision(self.board, end_row, end_column)},"
		  		print " #{piece.can_take?(self.board, end_row, end_column)})\n"
		  	end
		end
	 else
	 	puts "Invalid Move - Coord"
	 end
  end

#Display Function
  def display_board
  	#puts `clear`
  	puts "R -------------------"
  	self.board.each do |key, array|
  		print "#{key} | "
        self.board[key][0].each_with_index do |item, index|
	      	if self.board[key][0][index].is_a? Piece
	  			print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '') } "
	  		else
	  			print "#{self.board[key][0][index].to_s.gsub('"', '').gsub(',', '') } "
	  	    end
  		end
  			  		 print "|\n"
  	end
  	puts "  -------------------"
  	puts "C   1 2 3 4 5 6 7 8"
  end
end


