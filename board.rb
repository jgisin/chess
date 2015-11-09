class Board

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
  end


    attr_reader :board
    attr_reader :color

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

  def pawn_logic(row, piece, end_row, end_piece)
  	if @board[row][0][piece] == 'P'
  		if end_row - row == 1 || row - end_row == 1
  			if end_piece == piece
  				return true
  			else
  				return false
  			end
  		else
  			return false
  		end
  	end
  end

  def update_board_move(row, piece, end_row, end_piece)
  	if pawn_logic(row, piece, end_row, end_piece)
  	 @board[end_row][0][end_piece] =  @board[row][0][piece]
  	 @board[row][0][piece] = '_'.to_s.gsub('"', '').gsub(',', '')	
  	 return true
  	else
  		puts "Invalid Move"
  		return false
  	end
  end

  def update_color_move(row, piece, end_row, end_piece)
  	 @color[end_row][0][end_piece] =  @color[row][0][piece]
  	 @color[row][0][piece] = '_'.to_s.gsub('"', '')
  end

  def move_piece(row, piece, end_row, end_piece)
  	if update_board_move(row, piece, end_row, end_piece)
  		update_color_move(row, piece, end_row, end_piece)
  	end
  end


  def display_board(var)
  	puts "---------------------"
  	var.each do |key, array|
  		print "| #{var[key][0]} |"
  		 print "\n"
  	end
  	puts "---------------------"
  end
end



board = Board.new
board.set_pieces
board.display_board(board.board)
board.display_board(board.color)