

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

  def logic(board, end_row, end_column)
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

  #def rook_logic(row, piece, end_row, end_piece)
  	#if @board[row][0][piece] == 'R'
  		#if piece == end_piece && row != end_row
  			#(row - end_row).abs.times do |time|
  				#if @board[row + time][0] != "_"
  					#puts "Invalid Move"
  					#return false
  				#end
  			#end
  		#end
  		#elsif row == end_row && piece != end_piece	

  	#end

  #end
end