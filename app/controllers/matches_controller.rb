class MatchesController < ApplicationController

	def index
		@matches = Match.all
	end

	def show
		@match = Match.find(params[:id])
		@team_a = Team.find_by(match_id: @match.id, team_number: 1)
		@team_b = Team.find_by(match_id: @match.id, team_number: 2)
		@count = Count.new
		#@sum_a = @team_a.counts.sum(:count)
		#@sum_b = @team_b.counts.sum(:count)
		@sum_a = @team_a.totalcount
		@sum_b = @team_b.totalcount
	end

end
