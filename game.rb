require_relative 'piece'
require_relative 'board'



class Game

end

b = Board.new
p = Pawn.new(7,1,"W")

b.move_piece(p, 6, 1)
b.display_board(b.board)