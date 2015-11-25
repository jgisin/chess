require 'sinatra'
require 'byebug'
require_relative 'game'

	move_piece = nil
		g = Game.new
		current_turn = "W"

enable :sessions

get '/' do

	session['b'] = g.b
	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	if (params["Row"] != nil) && (params["Column"] != nil) &&
		session['b'].find_piece(params["Row"].to_i, params["Column"].to_i).color == current_turn
		session['c'] = session['b'].find_piece(params["Row"].to_i, params["Column"].to_i)
		redirect("move?#{query}")
	elsif (params["Row"] != nil) && (params["Column"] != nil) &&
		session['b'].find_piece(params["Row"].to_i, params["Column"].to_i).color != current_turn
		redirect("/")
	end

	def piece?(piece)

		if piece.is_a? Piece
			return "/?Row=#{piece.row}&Column=#{piece.column}"
		else
			return "/"
		end
	end



	erb :index, :locals => {:g => g, :selected_piece => session['c'], :current_turn => current_turn}
end

get '/move' do
	session['b'] = g.b
	query = params.map{|key, value| "#{key}=#{value}"}.join("&")
	if (params["End_Row"] != nil) && (params["End_Column"] != nil) && 
		g.move_piece(g.b.board[session['c'].row][0][session['c'].column], session['b'], params["End_Row"].to_i, params["End_Column"].to_i, current_turn)
		current_turn = g.turn(current_turn)
		redirect("/")
	elsif (params["End_Row"] != nil) && (params["End_Column"] != nil) && 
		g.move_piece(session['c'], session['b'], params["End_Row"].to_i, params["End_Column"].to_i, "W") == false
		redirect("move?Row=#{session['c'].row}&Column=#{session['c'].column}")
	end

	def selector(selected_piece, piece)
		if (piece.is_a? Piece) && (selected_piece.column == piece.column) &&
			(selected_piece.row == piece.row)
			return "Active"
		else
			return "Inactive"
		end
	end

	erb :move, :locals => {:g => g, :selected_piece => session['c'], :current_turn => current_turn}
end










