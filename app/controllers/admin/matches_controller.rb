class Admin::MatchesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_admin_user

	def index
	end

	def only_admin_user
		if current_user.admin?

		else
			redirect_to matches_path
		end
	end
end
