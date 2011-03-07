class Member::MemberController < ApplicationController
	filter_access_to :all
	helper_method :num_games
	helper_method :rated_games
	
	def index
		@games = Game.paginate_by_user_id(current_user,:page => params[:page], :order => 'created_at DESC')
	end
	
	def num_games(user)
      return Game.count(:conditions => ["user_id = ?", user.id])    
    end
	
	def rated_games(user)
		return Game.count(:conditions => ['rating != "" and user_id = ?', user.id ])    
	end
end