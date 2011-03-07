class Member::MemberController < ApplicationController
	filter_access_to :all
	
	
	def index
		@all_games = Game.find_by_user_id(current_user)
		#@percent = all_games.find_all_by_rating(!nil).count / all_games.count * 100
		@games = Game.paginate_by_user_id(current_user,:page => params[:page], :order => 'created_at DESC')
	end
end