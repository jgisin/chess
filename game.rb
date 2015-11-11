require_relative 'piece'
require_relative 'board'



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
end

g = Game.new


g.b.move_piece(g.nw1, 3, 2)
g.b.move_piece(g.nw1, 4, 4)
g.b.move_piece(g.nw1, 6, 3)
g.nw1.valid_moves(g.b, 1,1)
g.b.display_board