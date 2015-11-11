require 'colorize'
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

    def find_piece(row, column)
    	if self.board[row][0][column].is_a? Piece
    		return self.board[row][0][column]
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
		  	 if piece.type == "P" || piece.type == "K"
		  	 	piece.times_moved += 1
		  	 end
	end

#Move function
  def move_piece(piece, end_row, end_column, turn)
  	if valid_coord(end_row, end_column) && (turn == piece.color)
		  	if (piece.logic(self.board, end_row, end_column)) && 
		  	   (piece.check_collision(self.board, end_row, end_column))
		  		replace_piece(piece, end_row, end_column)
		  		return true
		  	elsif (piece.type == "P" || piece.type == "N" || piece.type == "K") && 
		  		(piece.check_collision(self.board, end_row, end_column)) &&
		  		(self.board[end_row][0][end_column].is_a? Piece)
		  		replace_piece(piece, end_row, end_column)
		  		return true
		  	else
		  		print "Invalid Move - Logic/Collision (#{piece.logic(self.board, end_row, end_column)},"
		  		print " #{piece.check_collision(self.board, end_row, end_column)}) \n"
				return false
		  	end
	 else
	 	puts "Invalid Move - Coord/Color"
	 	return false
	 end
  end

#Display Function
  def display_board
  	background = 0
  	puts `clear`
  	puts "    1 2 3 4 5 6 7 8  C"
  	puts "R -------------------"
  	self.board.each do |key, array|
  		print "#{key} | "
        self.board[key][0].each_with_index do |item, index|
        	if background == 0
		      	if self.board[key][0][index].is_a? Piece
			      		if self.board[key][0][index].color == "W"
			  				print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '')} ".colorize(:cyan)
			  				background += 1
			  			elsif self.board[key][0][index].color == "B"
			  				print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '')} ".colorize(:magenta)
			  				background += 1
			  			end
		  		else
		  			print "#{self.board[key][0][index].to_s.gsub('"', '').gsub(',', '') } "
		  	    	background += 1
		  	    end
		  	else
		  		if self.board[key][0][index].is_a? Piece
			      		if self.board[key][0][index].color == "W"
			  				print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '')} ".colorize(:cyan).on_black
			  				background -= 1
			  			elsif self.board[key][0][index].color == "B"
			  				print "#{self.board[key][0][index].type.to_s.gsub('"', '').gsub(',', '')} ".colorize(:magenta).on_black
			  				background -= 1
			  			end
		  		else
		  			print "#{self.board[key][0][index].to_s.gsub('"', '').gsub(',', '') } ".on_black
		  			background -= 1
		  	    end
		  	end
  		end
  			  		 print "| #{key}\n"
  			  		 if background == 1
  			  		 	background = 0
  			  		 else
  			  		 	background = 1
  			  		 end
  	end
  	puts "  ------------------- R"
  	puts "C   1 2 3 4 5 6 7 8"
  end
end


