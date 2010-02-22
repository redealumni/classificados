# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  protected
  
  #Before Filter
  def enforce_privileges
    unless can_edit?
      flash[:error] = I18n.t(:access_denied)
      redirect_to ads_path 
    end
  end
  
  def can_edit?
    session[:admin_user]
  end
  helper_method :can_edit?
end
