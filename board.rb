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


    @color = {     1 => [(1..8).to_a],
			 	   2 => [(1..8).to_a],
			 	   3 => [(1..8).to_a],
			 	   4 => [(1..8).to_a],
			 	   5 => [(1..8).to_a],
			 	   6 => [(1..8).to_a],
			 	   7 => [(1..8).to_a],
			 	   8 => [(1..8).to_a]
			 	}
		set_pieces
  end

#Accessors for boards
    attr_reader :board
    attr_reader :color

#Populates boards for new game
  def set_pieces
	  @board[1][0] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'].to_s.gsub('"', '').gsub(',', '')  
	  @board[2][0] = ['P','P','P','P','P','P','P','P'].to_s.gsub('"', '').gsub(',', '')  
	  @board[3][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '')   
	  @board[4][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '')
	  @board[5][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '') 
	  @board[6][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '')   
	  @board[7][0] = ['P','P','P','P','P','P','P','P'].to_s.gsub('"', '').gsub(',', '') 
	  @board[8][0] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'].to_s.gsub('"', '').gsub(',', '')  

	  @color[1][0] = ['W', 'W', 'W', 'W', 'W', 'W', 'W', 'W'].to_s.gsub('"', '').gsub(',', '')  
	  @color[2][0] = ['W', 'W', 'W', 'W', 'W', 'W', 'W', 'W'].to_s.gsub('"', '').gsub(',', '')   
	  @color[3][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '')   
	  @color[4][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '') 
	  @color[5][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '') 
	  @color[6][0] = ['_', '_', '_', '_', '_', '_', '_', '_',].to_s.gsub('"', '').gsub(',', '')   
	  @color[7][0] = ['B', 'B', 'B', 'B', 'B', 'B', 'B', 'B'].to_s.gsub('"', '').gsub(',', '') 
	  @color[8][0] = ['B', 'B', 'B', 'B', 'B', 'B', 'B', 'B'].to_s.gsub('"', '').gsub(',', '') 
  end





#Update piece board and color board with move
  def update_board_move(piece, end_row, end_column)
  	if piece.logic(self.board, end_row, end_column)
  	 self.board[end_row][0][end_column] =  self.board[piece.row][0][piece.column]
  	 self.board[piece.row][0][piece.column] = '_'.to_s.gsub('"', '').gsub(',', '')	
  	 return true
  	else
  		puts "Invalid Move"
  		return false
  	end
  end

  def update_color_move(piece, end_row, end_column)
  	 self.color[end_row][0][end_column] =  self.color[piece.row][0][piece.column]
  	 self.color[piece.row][0][piece.column] = '_'.to_s.gsub('"', '')
  end



#Move function
  def move_piece(piece, end_row, end_column)
  	if update_board_move(piece, end_row, end_column)
  		update_color_move(piece, end_row, end_column)
  	end
  end

#Display Function
  def display_board(board)
  	puts "---------------------"
  	board.each do |key, array|
  		print "| #{board[key][0]} |"
  		 print "\n"
  	end
  	puts "---------------------"
  end
end


