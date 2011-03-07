class Admin::AdminController < ApplicationController
	before_filter :require_user
	filter_access_to :all
	
	def index
		@games = Game.paginate(:page => params[:page], :order => 'created_at DESC')
	end
end