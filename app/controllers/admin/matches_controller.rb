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
	end

	def create
		match = Match.new(match_params)
		match.save
		redirect_to  admin_matches_path
	end

	def update
    match = Match.find(params[:id])
    if match.update(match_params)
      redirect_to admin_match_path(match.id)
    end
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

	def match_params
		params.require(:match).permit(:match_status)
	end

end
