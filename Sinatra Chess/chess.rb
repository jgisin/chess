require 'sinatra'
require 'byebug'
require_relative 'game'

	move_piece = nil
		g = Game.new
		a1 = g.b.board[1][0][0]
		a2 = g.b.board[1][0][1]
		a3 = g.b.board[1][0][2]
		a4 = g.b.board[1][0][3]
		a5 = g.b.board[1][0][4]
		a6 = g.b.board[1][0][5]
		a7 = g.b.board[1][0][6]
		a8 = g.b.board[1][0][7]

		b1 = g.b.board[2][0][0]
		b2 = g.b.board[2][0][1]
		b3 = g.b.board[2][0][2]
		b4 = g.b.board[2][0][3]
		b5 = g.b.board[2][0][4]
		b6 = g.b.board[2][0][5]
		b7 = g.b.board[2][0][6]
		b8 = g.b.board[2][0][7]

		c1 = g.b.board[3][0][0]
		c2 = g.b.board[3][0][1]
		c3 = g.b.board[3][0][2]
		c4 = g.b.board[3][0][3]
		c5 = g.b.board[3][0][4]
		c6 = g.b.board[3][0][5]
		c7 = g.b.board[3][0][6]
		c8 = g.b.board[3][0][7]

		d1 = g.b.board[4][0][0]
		d2 = g.b.board[4][0][1]
		d3 = g.b.board[4][0][2]
		d4 = g.b.board[4][0][3]
		d5 = g.b.board[4][0][4]
		d6 = g.b.board[4][0][5]
		d7 = g.b.board[4][0][6]
		d8 = g.b.board[4][0][7]

		e1 = g.b.board[5][0][0]
		e2 = g.b.board[5][0][1]
		e3 = g.b.board[5][0][2]
		e4 = g.b.board[5][0][3]
		e5 = g.b.board[5][0][4]
		e6 = g.b.board[5][0][5]
		e7 = g.b.board[5][0][6]
		e8 = g.b.board[5][0][7]

		f1 = g.b.board[6][0][0]
		f2 = g.b.board[6][0][1]
		f3 = g.b.board[6][0][2]
		f4 = g.b.board[6][0][3]
		f5 = g.b.board[6][0][4]
		f6 = g.b.board[6][0][5]
		f7 = g.b.board[6][0][6]
		f8 = g.b.board[6][0][7]

		g1 = g.b.board[7][0][0]
		g2 = g.b.board[7][0][1]
		g3 = g.b.board[7][0][2]
		g4 = g.b.board[7][0][3]
		g5 = g.b.board[7][0][4]
		g6 = g.b.board[7][0][5]
		g7 = g.b.board[7][0][6]
		g8 = g.b.board[7][0][7]

		h1 = g.b.board[8][0][0]
		h2 = g.b.board[8][0][1]
		h3 = g.b.board[8][0][2]
		h4 = g.b.board[8][0][3]
		h5 = g.b.board[8][0][4]
		h6 = g.b.board[8][0][5]
		h7 = g.b.board[8][0][6]
		h8 = g.b.board[8][0][7]

		lcl = {g: g, move_piece: move_piece, 
			a1: a1, 
			a2: a2, 
			a3: a3, 
			a4: a4, 
			a5: a5, 
			a6: a6, 
			a7: a7, 
			a8: a8,

			b1: b1, 
			b2: b2, 
			b3: b3, 
			b4: b4, 
			b5: b5, 
			b6: b6, 
			b7: b7, 
			b8: b8,

			c1: c1,
			c2: c2,
			c3: c3,
			c4: c4,
			c5: c5,
			c6: c6,
			c7: c7,
			c8: c8,

			d1: d1,
			d2: d2,
			d3: d3,
			d4: d4,
			d5: d5,
			d6: d6,
			d7: d7,
			d8: d8,

			e1: e1,
			e2: e2,
			e3: e3,
			e4: e4,
			e5: e5,
			e6: e6,
			e7: e7,
			e8: e8,

			f1: f1,
			f2: f2,
			f3: f3,
			f4: f4,
			f5: f5,
			f6: f6,
			f7: f7,
			f8: f8,

			g1: g1,
			g2: g2,
			g3: g3,
			g4: g4,
			g5: g5,
			g6: g6,
			g7: g7,
			g8: g8,

			h1: h1,
			h2: h2,
			h3: h3,
			h4: h4,
			h5: h5,
			h6: h6,
			h7: h7,
			h8: h8}
enable :sessions
get '/' do
	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	move_piece = nil
	if (params["Row"] != nil) && (params["Column"] != nil)
		redirect("move?#{query}")
	end
	erb :index, :locals => lcl
end

get '/move' do

	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	if (params["End_Row"] != nil) && (params["End_Column"] != nil)
			if g.move_piece(move_piece, g.b, g.row(params["End_Row"]), (params["End_Column"].to_i - 1), "W")
				session['b'] = g.b
				puts "Piece #{move_piece.type} Chosen"
				redirect("final?#{query}")
			else
				puts "No Piece Chosen"
			end
	else
			move_piece = g.b.find_piece(g.row(params["Row"]), params["Column"].to_i - 1)
	end


	erb :move, :locals => lcl
end

get '/final' do

	g.b.display_board
	erb :final, :locals => lcl
end