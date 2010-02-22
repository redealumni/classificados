class AdminController < ApplicationController
  USER_NAME, PASSWORD = "admin", "admin"
  
  before_filter :authenticate
  
  def signin
    session[:admin_user] = true
    flash[:notice] = I18n.t(:logged_in_as_admin)
    redirect_to ads_path
  end
  
  def signoff
    session[:admin_user] = nil
    flash[:notice] = I18n.t(:logged_off_as_admin)
    redirect_to ads_path
  end
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == USER_NAME && password == PASSWORD
    end
  end
  
end
