# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
 
  filter_parameter_logging :password
  helper_method :current_user_session
  helper_method :current_user
  helper_method :find_root
  
  private
  
  def current_user_session
	return @current_user_session if defined?(@current_user_session)
	@current_user_session = UserSession.find
	return @current_user_session
  end
  
  def current_user
	return @current_user if defined?(@current_user)
	@current_user = current_user_session && current_user_session.user
	#return @current_user
 end

  def home_url
	if current_user.role == "admin"
		return admin_root_url
	else
		return member_root_url
	end
  end

end
