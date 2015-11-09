require_relative 'piece'
require_relative 'board'



class Game
	def initialize
	  @b = Board.new
	  b.board[1][0] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R']
	  b.board[2][0] = [@pw1 = Pawn.new(2,1,"W"), @pw2 = Pawn.new(2,2,"W"), @pw3 = Pawn.new(2,3,"W"),
	   				   @pw4 = Pawn.new(2,4,"W"), @pw5 = Pawn.new(2,5,"W"), @pw6 = Pawn.new(2,6,"W"),
	   				   @pw7 = Pawn.new(2,7,"W"), @pw8 = Pawn.new(2,8,"W"),]
	  b.board[3][0] = ['_', '_', '_', '_', '_', '_', '_', '_',] 
	  b.board[4][0] = ['_', '_', '_', '_', '_', '_', '_', '_',]
	  b.board[5][0] = ['_', '_', '_', '_', '_', '_', '_', '_',] 
	  b.board[6][0] = ['_', '_', '_', '_', '_', '_', '_', '_',]
	  b.board[7][0] = [@pb1 = Pawn.new(7,1,"B"), @pb2 = Pawn.new(7,2,"B"), @pb3 = Pawn.new(7,3,"B"),
	   				   @pb4 = Pawn.new(7,4,"B"), @pb5 = Pawn.new(7,5,"B"), @pb6 = Pawn.new(7,6,"B"),
	   				   @pb7 = Pawn.new(7,7,"B"), @pb8 = Pawn.new(7,8,"B"),] 
	  b.board[8][0] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'] 
	end
	attr_reader :b
	attr_accessor :pw1, :pw2, :pw3, :pw4, :pw5, :pw6, :pw7, :pw8
	attr_accessor :pb1, :pb2, :pb3, :pb4, :pb5, :pb6, :pb7, :pb8
end

g = Game.new

puts g.pb1.row, g.pb1.column
g.b.move_piece(g.pb1, 4, 1)
g.b.display_board