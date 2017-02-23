class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def current_user
  	  @current_user ||= User.find(session[:user_id])	if session[:user_id] #return @current_user if exists otherwise find from session and the return it 
  end

  def logged_in?
  	!!current_user#returns true if current_user exists otherwise returns false
  end

  def require_user
  	if logged_in?
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to root_path
  	end
  end
end
