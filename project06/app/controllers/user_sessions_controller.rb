class UserSessionsController < ApplicationController

  
  
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def destroy
    current_user.last_login_at = Time.now
	current_user_session.destroy
	flash[:notice] = "Logged Out."
	redirect_to root_url
  end
  
end
