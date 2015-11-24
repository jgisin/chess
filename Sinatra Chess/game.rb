require_relative 'piece'
require_relative 'board'
require 'byebug'



class Game
	def initialize
	  @b = Board.new
	  b.board[1][0] = [@rw1 = Rook.new(1,0,"W"), @nw1 = Knight.new(1,1,"W"),
	  				   @bw1 = Bishop.new(1,2,"W"), @qw1 = Queen.new(1,3,"W"), @kw1 = King.new(1,4,"W"),
	  				   @bw2 = Bishop.new(1,5,"W"), @nw2 = Knight.new(1,6,"W"), @rw2 = Rook.new(1,7,"W")]
	  b.board[2][0] = [@pw1 = Pawn.new(2,0,"W"), @pw2 = Pawn.new(2,1,"W"), @pw3 = Pawn.new(2,2,"W"),
	   				   @pw4 = Pawn.new(2,3,"W"), @pw5 = Pawn.new(2,4,"W"), @pw6 = Pawn.new(2,5,"W"),
	   				   @pw7 = Pawn.new(2,6,"W"), @pw8 = Pawn.new(2,7,"W"),]
	  b.board[3][0] = ['_', '_', '_', '_', '_', '_', '_', '_',] 
	  b.board[4][0] = ['_', '_', '_', '_', '_', '_', '_', '_',]
	  b.board[5][0] = ['_', '_', '_', '_', '_', '_', '_', '_',] 
	  b.board[6][0] = ['_', '_', '_', '_', '_', '_', '_', '_',]
	  b.board[7][0] = [@pb1 = Pawn.new(7,0,"B"), @pb2 = Pawn.new(7,1,"B"), @pb3 = Pawn.new(7,2,"B"),
	   				   @pb4 = Pawn.new(7,3,"B"), @pb5 = Pawn.new(7,4,"B"), @pb6 = Pawn.new(7,5,"B"),
	   				   @pb7 = Pawn.new(7,6,"B"), @pb8 = Pawn.new(7,7,"B"),] 
	  b.board[8][0] = [@rb1 = Rook.new(8,0,"B"), @nb1 = Knight.new(8,1,"B"),
	  				   @bb1 = Bishop.new(8,2,"B"), @qb1 = Queen.new(8,3,"B"), @kb1 = King.new(8,4,"B"),
	  				   @bb2 = Bishop.new(8,5,"B"), @nb2 = Knight.new(8,6,"B"), @rb2 = Rook.new(8,7,"B")] 
	end
	attr_reader :b
	attr_accessor :pw1, :pw2, :pw3, :pw4, :pw5, :pw6, :pw7, :pw8
	attr_accessor :rw1, :rw2, :nw1, :nw2, :bw1, :bw2, :qw1, :kw1
	attr_accessor :pb1, :pb2, :pb3, :pb4, :pb5, :pb6, :pb7, :pb8
	attr_accessor :rb1, :rb2, :nb1, :nb2, :bb1, :bb2, :qb1, :kb1

	def piece_of_color(color)
		pieces = []
		b.board.each do |row, not_used|
			b.board[row][0].each_with_index do |piece, column|
				if (piece.is_a? Piece) && (piece.color == color)
					pieces << piece
				end
			end
		end
		return pieces
	end



def row(param)
	case param
	when "A"
		return 1
	when "B"
		return 2
	when "C"
		return 3
	when "D"
		return 4
	when "E"
		return 5
	when "F"
		return 6
	when "G"
		return 7
	when "H"
		return 8
	end
end

	#Move function
  def move_piece(piece, board, end_row, end_column, turn)
  	if b.valid_coord(end_row, end_column) && (turn == piece.color) 
		  	if (piece.logic(board.board, end_row, end_column)) && 
		  	   (piece.check_collision(board.board, end_row, end_column))
		  		b.replace_piece(piece, end_row, end_column)
		  		return true


		  	elsif ((piece.type == "P") || (piece.type == "N") || (piece.type == "K")) && 
		  		(piece.check_collision(board.board, end_row, end_column)) &&
		  		(board.board[end_row][0][end_column].is_a? Piece)
		  		b.replace_piece(piece, end_row, end_column)
		  		return true


		  	else
		  		print "Invalid Move - Logic/Collision (#{piece.logic(board.board, end_row, end_column)},"
		  		print " #{piece.check_collision(board.board, end_row, end_column)}) \n"
				return false
		  	end


	 else
	 	puts "Invalid Move - Coord/Color"
	 	return false
	 end
  end

  def test_move_piece(piece, board, end_row, end_column, turn)
  	if board.valid_coord(end_row, end_column) && (turn == piece.color) 
		  	if (piece.logic(board.board, end_row, end_column)) && 
		  	   (piece.check_collision(board.board, end_row, end_column))
		  		board.test_replace(piece, end_row, end_column)
		  		return true
		  	elsif ((piece.type == "P") || (piece.type == "N") || (piece.type == "K")) && 
		  		(piece.check_collision(board.board, end_row, end_column)) &&
		  		(board.board[end_row][0][end_column].is_a? Piece)
		  		board.test_replace(piece, end_row, end_column)
		  		return true
		  	else
				return false
		  	end
	 else
	 	return false
	 end
  end

	def check?(board, turn)
		if turn == "B"

			possible = piece_of_color("W")
			takes = []

			possible.each do |white|
				takes += white.valid_moves(board, "take")
			end

			if takes.include? "#{kb1.row}#{kb1.column}".to_i
				return true
			else 
				return false
			end



		else
			possible = piece_of_color("B")
			takes = []

			possible.each do |black|
				takes += black.valid_moves(board, "take")
			end
			if takes.include? "#{kw1.row}#{kw1.column}".to_i
				return true
			else 
				return false
			end
		end
	end

	def test_board(current_board)
		test = Board.new

		test.board.each do |row, not_used|
			test.board[row][0].each_with_index do |piece, column|
				test.board[row][0][column] = current_board.board[row][0][column]
			end
		end

		return test
	end

	def checkmate?(turn)
		valid = 0

		if turn == "B"

			possible = piece_of_color("W")
			moves = []

			possible.each do |white|
				moves += white.valid_moves(b, "all")
					moves.each do |move|
						coord = move.to_s.split('')
						#board = test_board
						test_turn = turn(turn)
						#byebug
						test_move_piece(white, test_board(b), coord[0].to_i, coord[1].to_i, test_turn)
						if check?(test_board(b), turn) == false
							valid += 1
						end
					end
				
			end



		else
			possible = piece_of_color("B")
			moves = []

			possible.each do |black|
				moves += black.valid_moves(b, "all")
					moves.each do |move|
						coord = move.to_s.split('')
						#board = test_board(turn)
						test_turn = turn(turn)
						#byebug
						test_move_piece(black, test_board(b), coord[0].to_i, coord[1].to_i, test_turn)
						if check?(test_board(b), turn) == false
							valid += 1
						end
					end
				
			end

		end

			if valid > 0
				return false
			else
				return true
			end
	end

	def turn(current_turn = "W")
		if current_turn == "W"
			return "B"
		else
			return "W"
		end
	end

	def move(take_piece, current_turn)
		if check?(b, current_turn) == true
			if (move_piece(piece, b, row, column, current_turn)) &&
				(check?(current_turn) == false)
				current_turn = turn(current_turn)
			else
				print "You are still in check."
				move_piece(piece, b, current_row, current_column, current_turn)
				b.board[row][0][column] = take_piece
			end
		elsif (check?(b, current_turn) == false) &&
		   (move_piece(piece, b, row, column, current_turn))
			current_turn = turn(current_turn)
		end
	end

	def img_tag(piece)
		if piece.is_a? Piece
			return "chess/#{piece.color}#{piece.type}"
		else
			return "chess/default"
		end
	end


	def display_status(turn)
		print "It is #{turn}'s turn\n"
	end

	def game_loop
		row = 0
		column = 0
		current_turn = "W"
		while checkmate?(current_turn) == false
			b.display_board
			display_status(current_turn)

			if check?(b, current_turn)
				puts "Your are in check"
			end

			puts "Select your piece. Row: "
			row = gets.chomp.to_i
			puts "Select your piece. Column: "
			column = gets.chomp.to_i - 1
			#byebug
			if b.find_piece(row, column) != false
				piece = b.find_piece(row, column)
			else
				puts "Not a Valid Piece"
				next
			end
			current_row = row
			current_column = column
			puts "Where to move. Row: "
			row = gets.chomp.to_i
			puts "Where to move. Column: "
			column = gets.chomp.to_i - 1
				if (b.find_piece(row, column).is_a? Piece)
					take_piece = b.find_piece(row, column)
				else
					take_piece = "_"
				end
				if check?(b, current_turn) == true
					if (move_piece(piece, b, row, column, current_turn)) &&
						(check?(b, current_turn) == false)
						current_turn = turn(current_turn)
					else
						print "You are still in check."
						b.board[current_row][0][current_column] = piece
						piece.row = current_row
						piece.column = current_column
						b.board[row][0][column] = take_piece
					end
				elsif (check?(b, current_turn) == false) &&
				   (move_piece(piece, b, row, column, current_turn))
				   if check?(b, current_turn) == true
				   		print "This will put you in check."
						b.board[current_row][0][current_column] = piece
						piece.row = current_row
						piece.column = current_column
						b.board[row][0][column] = take_piece
					else
					current_turn = turn(current_turn)
					end
				end

		end
		b.display_board
		puts "Checkmate! #{turn(current_turn)} wins!"
	end
end

