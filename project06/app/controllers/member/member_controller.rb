class Member::MemberController < ApplicationController
	before_filter :require_user
	filter_access_to :all
	
	def index
		@games = Game.paginate_by_user_id(current_user,:page => params[:page], :order => 'created_at DESC')
	end
end