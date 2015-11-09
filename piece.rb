require_relative 'board'

class Piece

	#Checks for piece and color
  def color(board, piece)
  	return board.color[piece.row][0][piece.column]
  end


end



class Pawn < Piece

	def initialize(row, column)
		@type = "P"
		@row = row
		@column = column
	end

	attr_accessor :type
	attr_accessor :row
	attr_accessor :column

  def logic(object, board, end_row, end_column)
  	if board[object.row][0][object.column] == 'P'
  		if end_row - object.row == 1 || object.row - end_row == 1
  			if end_column == object.column
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


b = Board.new
p = Pawn.new(7, 1)
puts p.logic(p, b.board, 6, 1)
puts p.type
puts p.color(b, p)