class Admin::MatchesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_admin_user

	def index
		@matches = Match.all
	end

	def new
		@match = Match.new
	end

	def show
		@match = Match.find(params[:id])
		@results = Countresult.all
	end

	def create
		match = Match.new(match_params)
		match.save
		redirect_to  admin_matches_path
	end

	def update
    	match = Match.find(params[:id])
    	match.update(matchs_params)
    	if match.match_status == "試合終了"
    		team = Team.find(params[:match][:team_id])
    		team.result = true
    		team.save
    		lose_team = Team.find_by(match_id: match, result: "lose")
    		odds = (lose_team.totalcount / team.totalcount.to_f).round(0)
    		team.counts.each do |count|
    			@result = Countresult.new(user_id: count.user_id, countresult:count.count)
    			@result.countresult = @result.countresult*odds
    			@result.save
    		end
    		redirect_to admin_match_path(match.id)
    	else
    		redirect_to admin_matches_path
    	end
    end

    def destroy
		@match = Match.find(params[:id])
		@match.destroy
		redirect_to admin_matches_path
	end
	private
		def match_params
			params.require(:match).permit(:genre, :match_name, :match_status, :match_day,
											teams_attributes: [:id, :team_number, :team_name, :team_image, :destroy])
		end

	def only_admin_user
		if current_user.admin?
		else
			redirect_to matches_path
		end
	end

	def matchs_params
		params.require(:match).permit(:match_status)
	end

end
