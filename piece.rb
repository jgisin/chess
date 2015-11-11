
#******************* Class Definition for Piece *******************
class Piece

	def initialize(row, column, color)
		@row = row
		@column = column
		@color = color
	end

	attr_accessor :row, :column
	attr_reader :color

	def valid_moves(board, end_row, end_column)
		board.board.each do |row, not_used|
			board.board[row][0].each_with_index do |value, column|
				if self.logic(board.board, row, column)
					print "#{row},#{column + 1} "
					print "Logic Passes "
					if ((self.check_collision(board.board, row, column) == false) &&
					   (value.is_a? Piece))
					    print "Collision-Non-Target \n"
						next
					elsif (self.check_collision(board.board, row, column) == false) &&
					      (value.is_a? Piece) &&
					      (self.color == value.color)
					    print "Collision-Same-Color \n"
						next
					elsif ((self.check_collision(board.board, row, column) == true) &&
					      (value.is_a? Piece) &&
					      (self.color != value.color))
					    print "Collision-Take \n"
					else
						print "No Collision \n"
						next 
					end
				elsif (self.logic(board.board, row, column) == false) &&
					  (self.check_collision(board.board, row, column) == true) &&
					  (self.type == "P") && (value.is_a? Piece)
					  print "#{row},#{column + 1} "
					  print "Collision-Take \n"
				elsif self.logic(board.board, row, column) == false
					print "#{row},#{column + 1} "
					print "Logic Fails \n"
				else
					print "#{row},#{column + 1} "
					print "Logic Fails \n"
				end
			end
		end
	end

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
  	if (board[end_row][0][end_column].is_a? Piece) &&
  		(can_take?(board, end_row, end_column) == false)
  		return false
  	elsif (board[end_row][0][end_column].is_a? Piece) &&
  		  (can_take?(board, end_row, end_column) == true)
  		return true
  	else
  		return true
  	end
  end

  def logic(board, end_row, end_column)
  	#Pawn can move two squares on first move
  	if self.times_moved == 0
		  	if self.color == "W"
		  		if end_row - self.row <= 2 && end_row - self.row > 0
		  			if end_column == self.column
		  				return true
		  			else
		  				return false
		  			end
		  		else
		  			return false
		  		end
		  	elsif self.color == "B"
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
		  	if self.color == "W"
		  		if end_row - self.row == 1
		  			if end_column == self.column
		  				return true
		  			else
		  				return false
		  			end
		  		else
		  			return false
		  		end
		  	elsif self.color == "B"
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

  def can_take?(board, end_row, end_column)
  	if self.color == "B"
	  	if (end_row - self.row) == -1 && (self.column - end_column).abs == 1 
			if board[end_row][0][end_column].color != self.color
				return true
			else
				return false
			end
		else
			return false
		end
	end
	if self.color == "W"
	  	if (end_row - self.row) == 1 && (self.column - end_column).abs == 1 
			if board[end_row][0][end_column].color != self.color
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

#******************* Class Definition for Rook *******************
 class Rook < Piece

 	def initialize(row, column, color)
		super
		@type = "R"
	end
		attr_reader :type


	def can_take?(board, end_row, end_column)
		return true
	end

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
  	  		if (board[row][0][self.column].is_a? Piece) && (row != end_row)
  	  			return false
  	  		elsif (board[row][0][self.column].is_a? Piece) && (row == end_row)
	  			if row == end_row && self.color == board[row][0][self.column].color
	  				return false
	  			elsif row == end_row && self.color != board[row][0][self.column].color
	  				return true
	  			end
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
	  		if (board[self.row][0][column].is_a? Piece) && (column != end_column)
	  			return false
	  		elsif (board[self.row][0][column].is_a? Piece) && (column == end_column)
	  			if column == end_column && self.color == board[self.row][0][column].color
	  				return false
	  			elsif column == end_column && self.color != board[self.row][0][column].color
	  				return true
	  			end
	  		end	
	  	end
	  	return true
	  end
  end

  def logic(board, end_row, end_column)
  		if self.column == end_column && self.row != end_row
  			return true
  		elsif self.row == end_row && self.column != end_column
  			return true
  		else
  			return false
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


  def can_take?(board, end_row, end_column)
  	if self.color == "W"
  		if board[end_row][0][end_column].color == "B"
  			return true
  		end
  	elsif self.color == "B"
  		if board[end_row][0][end_column].color == "W"
  			return true
  		end
  	else
  		return false
  	end
  end


  def check_collision(board, end_row, end_column)
  	if board[end_row][0][end_column].is_a? Piece
  		return false
  	else
  		return true
  	end
  end

  def logic(board, end_row, end_column)
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
	  	else
	  		return false
	  	end

	  	if self.column < end_column
	  		test_column = (self.column..end_column).to_a
	  		test_column.delete(test_column.first)
	  	elsif end_column < self.column
	  		test_column = (end_column..self.column).to_a.reverse
	  		test_column.delete(test_column.first)
	  	else
	  		return false
	  	end

	  	test_row.each_with_index do |value, index|
			if (board[value][0][test_column[index]].is_a? Piece) &&
				(value != end_row || test_column[index] != end_column)
				return false
			elsif (board[value][0][test_column[index]].is_a? Piece) &&
				  (value == end_row && test_column[index] == end_column)
				if board[value][0][test_column[index]].color == self.color
					return false
				elsif board[end_row][0][end_column].color != self.color
					return true
				end
			end
		end
		return true
	end

	def logic(board, end_row, end_column)
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
	test_rook = Rook.new(self.row,self.column,"W")
	#Bishop Collision Test
	test_bishop = Bishop.new(self.row,self.column,"W")


		if test_rook.check_collision(board, end_row, end_column) ||
		   test_bishop.check_collision(board, end_row, end_column)
		   return true
		else
			return false
		end
	end

	def logic(board, end_row, end_column)
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

#******************* Class Definition for King *******************

class King < Piece

	def initialize(row, column, color)
		super
		@type = "K"
		@in_check = false
		@times_moved = 0
	end
	attr_reader :type
	attr_accessor :in_check, :times_moved


	def check_collision(board, end_row, end_column)
		if board[end_row][0][end_column].is_a? Piece
	  		return false
	  	else
	  		return true
	  	end
  	end

  	def logic(board, end_row, end_column)
  		if (self.row - end_row).abs == 1 && (self.column - end_column).abs == 1
  			return true
  		elsif (self.row - end_row).abs == 1 && (self.column - end_column).abs == 0
  			return true
  		elsif (self.row - end_row).abs == 0 && (self.column - end_column).abs == 1
  			return true
  		else
  			return false
  		end
  	end
end