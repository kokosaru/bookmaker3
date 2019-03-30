class CountsController < ApplicationController
	before_action :authenticate_login_user

	def create
		@count = Count.new(count_params)
		team = Team.find(params[:count][:team_id])
     	@count.user_id = current_user.id
     	team.totalcount += @count.count
      current_user.rate -= @count.count
  	 	@count.save
      current_user.save
  	 	team.save
  	 	redirect_to matches_path
	end

	private
  def count_params
    params.require(:count).permit(:team_id, :count)
  end

  def authenticate_login_user
    unless :authenticate_user!
    redirect_to products_path
    flash[:notice] = "ログインして下さい"
    end
  end
end
