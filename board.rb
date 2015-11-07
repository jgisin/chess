class Board

	  def initialize
    @attributes = {a: [(1..8).to_a],
			 	   b: [(1..8).to_a],
			 	   c: [(1..8).to_a],
			 	   d: [(1..8).to_a],
			 	   e: [(1..8).to_a],
			 	   f: [(1..8).to_a],
			 	   g: [(1..8).to_a],
			 	   h: [(1..8).to_a]}
    @attributes.each do |k,v|
      self.class.send :define_method, k do v end
    end
  end




  def display_board
  	@attributes.each do |key, array|
  		print "#{@attributes[key][0]} "
  		 print "\n"
  	end
  end
end


board = Board.new
board.display_board