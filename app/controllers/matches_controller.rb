class MatchesController < ApplicationController

	def index
		@matches = Match.all
	end

	def show
		@match = Match.find(params[:id])
		@team_a = Team.find_by(match_id: @match.id, team_number: 1)
		@team_b = Team.find_by(match_id: @match.id, team_number: 2)
		@count = Count.new
	end

end
