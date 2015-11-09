

class Piece

	def initialize(row, column, color)
		@row = row
		@column = column
		@color = color
	end

	attr_accessor :row
	attr_accessor :column
	attr_reader :color

end



class Pawn < Piece

	def initialize(row, column, color)
		super
		@type = "P"
		@times_moved = 0
	end

	attr_reader :type
	attr_accessor :times_moved

  def check_collision(board, end_row, end_column)
  	return true
  end

  def logic(board, end_row, end_column)
  	#Pawn can move two squares on first move
  	if self.times_moved == 0
	  	if self.type == 'P' && self.color == "W"
	  		if end_row - self.row <= 2 && end_row - self.row > 0
	  			if end_column == self.column
	  				return true
	  			else
	  				return false
	  			end
	  		else
	  			return false
	  		end
	  	elsif self.type == 'P' && self.color == "B"
	  		if end_row - self.row >= -2 && end_row - self.row < 0
	  			if end_column == self.column
	  				return true
	  			else
	  				return false
	  			end
	  		else
	  			return false
	  		end
	  	end
	 else
	 #Pawn moves only one square forward on all other moves
	  	if self.type == 'P' && self.color == "W"
	  		if end_row - self.row == 1
	  			if end_column == self.column
	  				return true
	  			else
	  				return false
	  			end
	  		else
	  			return false
	  		end
	  	elsif self.type == 'P' && self.color == "B"
	  		if end_row - self.row == -1 
	  			if end_column == self.column
	  				return true
	  			else
	  				return false
	  			end
	  		else
	  			return false
	  		end
	  	end
	  end
  end

end

 class Rook < Piece

 	def initialize(row, column, color)
		super
		@type = "R"
	end
		attr_reader :type

  def check_collision(board, end_row, end_column)
  	  if self.column == end_column && self.row != end_row
  	  	if self.row < end_row
	  	  	test = (self.row..end_row).to_a
	  	  	test.delete(test.first)
	  	 else
	  	 	test = (end_row..self.row).to_a
	  	 	test.delete(test.last)
	  	 end
  	  	test.each do |row|
  	  		if board[row][0][self.column].is_a? Piece
  	  			return false
  	  		else 
  	  			return true
  	  		end	
  	  	end
  	  end
	   if self.row == end_row && self.column != end_column
	   	if self.column < end_column
		   	test = (self.column..end_column).to_a
	  	  	test.delete(test.first)
	  	else
	  		test = (end_column..self.column).to_a
	  		test.delete(test.last)
	  	end
	  	test.to_a.each do |column|
	  		if board[self.row][0][column].is_a? Piece 
	  			return false
	  		else 
	  			return true
	  		end	
	  	end
	  end
  end

  def logic(board, end_row, end_column)
  	if self.type == 'R'
  		if self.column == end_column && self.row != end_row
  			return true
  		elsif self.row == end_row && self.column != end_column
  			return true
  		else
  			return false
  		end
  	end
  end


end