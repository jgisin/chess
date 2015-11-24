require 'sinatra'
require 'byebug'
require_relative 'game'

	move_piece = nil
		g = Game.new

enable :sessions

get '/' do
	session['b'] = g.b
	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	if (params["Row"] != nil) && (params["Column"] != nil)
		session['c'] = session['b'].find_piece(params["Row"].to_i, params["Column"].to_i)
		redirect("move?#{query}")
	end





	erb :index, :locals => {:g => g, :selected_piece => session['c']}
end

get '/move' do
	puts session['c']
	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	if (params["End_Row"] != nil) && (params["End_Column"] != nil)
		g.move_piece(session['c'], session['b'], params["End_Row"].to_i, params["End_Column"].to_i, "W")
		redirect("/?#{query}")
	end

	def selector(selected_piece, piece)
		if (piece.is_a? Piece) && (selected_piece.column == piece.column) &&
			(selected_piece.row == piece.row)
			return "Active"
		else
			return "Inactive"
		end
	end

	erb :move, :locals => {:g => g, :selected_piece => session['c']}
end

get '/final' do
	session['b'] = g.b
	session['b'].display_board
	erb :final, :locals => {:g => g, :move_piece => move_piece}
end



	def piece?(piece)

		if piece.is_a? Piece
			return "/?Row=#{piece.row}&Column=#{piece.column}"
		else
			return "/"
		end
	end





