
#******************* Class Definition for Piece *******************
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


#******************* Class Definition for Pawn *******************
class Pawn < Piece

	def initialize(row, column, color)
		super
		@type = "P"
		@times_moved = 0
	end

	attr_reader :type
	attr_accessor :times_moved

  def check_collision(board, end_row, end_column)
  	if board[end_row][0][end_column].is_a? Piece
  		return false
  	else
  		return true
  	end
  end

  def logic(end_row, end_column)
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

#******************* Class Definition for Rook *******************
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
  	  		end	
  	  	end
  	  	return true
  	  end
	   if self.row == end_row && self.column != end_column
		   	if self.column < end_column
			   	test = (self.column..end_column).to_a
		  	  	test.delete(test.first)
		  	else
		  		test = (end_column..self.column).to_a
		  		test.delete(test.last)
		  	end
	  	test.each do |column|
	  		if board[self.row][0][column].is_a? Piece 
	  			return false
	  		end	
	  	end
	  	return true
	  end
  end

  def logic(end_row, end_column)
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

#******************* Class Definition for Knight *******************
class Knight < Piece


 	def initialize(row, column, color)
		super
		@type = "N"
	end
		attr_reader :type



 def check_collision(board, end_row, end_column)
  	if board[end_row][0][end_column].is_a? Piece
  		return false
  	else
  		return true
  	end
  end

  def logic(end_row, end_column)
  	if self.type == 'N'

  		if (self.row + 2 == end_row) || (self.row - 2 == end_row)
  			if (self.column + 1 == end_column) || (self.column - 1 == end_column)
  				return true
  			else
  				return false
  			end

  		elsif (self.column + 2 == end_column) || (self.column - 2 == end_column)
  			if (self.row + 1 == end_row) || (self.row - 1 == end_row)
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

#******************* Class Definition for Bishop *******************

class Bishop < Piece

 	def initialize(row, column, color)
		super
		@type = "B"
	end
		attr_reader :type

	def check_collision(board, end_row, end_column)
		if self.row < end_row
			test_row = (self.row..end_row).to_a
	  		test_row.delete(test_row.first)
	  	elsif end_row < self.row
	  		test_row = (end_row..self.row).to_a
	  		test_row.delete(test_row.last)
	  	end

	  	if self.column < end_column
	  		test_column = (self.column..end_column).to_a
	  		test_column.delete(test_column.first)
	  	elsif end_column < self.column
	  		test_column = (end_column..self.column).to_a
	  		test_column.delete(test_column.last)
	  	end

	  	test_row.each_with_index do |value, index|
			if board[value][0][test_column[index]].is_a? Piece
				return false
			elsif board[end_row][0][end_column].is_a? Piece
				return false
			end
		end
		return true
	end

	def logic(end_row, end_column)
		if (self.column - end_column).abs == (self.row - end_row).abs
			return true
		else
			return false
		end
	end
end

#******************* Class Definition for Queen *******************

class Queen < Piece


 	def initialize(row, column, color)
		super
		@type = "Q"
	end
	attr_reader :type

	def check_collision(board, end_row, end_column)
		#Rook Collision Test
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
  	  		end	
  	  	end
  	  	return true
  	  end
	   if self.row == end_row && self.column != end_column
		   	if self.column < end_column
			   	test = (self.column..end_column).to_a
		  	  	test.delete(test.first)
		  	else
		  		test = (end_column..self.column).to_a
		  		test.delete(test.last)
		  	end
	  	test.each do |column|
	  		if board[self.row][0][column].is_a? Piece 
	  			return false
	  		end	
	  	end
	  	return true
	  end

	  #Bishop Collision Test
	  if self.row < end_row
			test_row = (self.row..end_row).to_a
	  		test_row.delete(test_row.first)
	  	elsif end_row < self.row
	  		test_row = (end_row..self.row).to_a
	  		test_row.delete(test_row.last)
	  	end

	  	if self.column < end_column
	  		test_column = (self.column..end_column).to_a
	  		test_column.delete(test_column.first)
	  	elsif end_column < self.column
	  		test_column = (end_column..self.column).to_a
	  		test_column.delete(test_column.last)
	  	end

	  	test_row.each_with_index do |value, index|
			if board[value][0][test_column[index]].is_a? Piece
				return false
			elsif board[end_row][0][end_column].is_a? Piece
				return false
			end
		end
		return true
	end

	def logic(end_row, end_column)
		if (self.column - end_column).abs == (self.row - end_row).abs
			return true
		elsif self.column == end_column && self.row != end_row
  			return true
  		elsif self.row == end_row && self.column != end_column
  			return true
  		else
  			return false
  		end
	end
end