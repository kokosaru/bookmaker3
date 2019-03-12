class Admin::MatchesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_admin_user

	def index
	end

	def new
		@match = Match.new
	end

	def create
		match = Match.new(match_params)
		match.save
		redirect_to  admin_matches_path
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
end
