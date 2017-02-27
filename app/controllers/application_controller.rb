class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :friendship_request_sent?, :friendship_request_accepted?, 
                :user_knows_language?, :user_learns_language?

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

  def friendship_request_sent?(user)
    if current_user.friends.include?(user) || current_user.inverse_friends.include?(user)
    #if Friendship.all.where(user_id: current_user.id, friend_id: user.id) || Friendship.all.where(user_id: user.id, friend_id: current_user.id)
      true
    else
      false
    end
  end

  def friendship_request_accepted?(user_id)
    @friendship_accepted = Friendship.all.where(user_id: current_user.id, friend_id: user_id, confirmed: true) 
    @inverse_friendship_accepted = Friendship.all.where(user_id: user_id, friend_id: current_user.id, confirmed: true)
      #if user.in?current_user.friends || user.in?current_user.inverse_friends
      if @friendship_accepted.exists? or @inverse_friendship_accepted.exists?
      true
    else
      false
    end
  end

  def user_knows_language?(language_id)
    @knows_languages = current_user.languages.where(id: language_id)
    if @knows_languages.exists?
      true
    else
      false
    end
  end

  def user_learns_language?(language_id)
    @knows_languages = current_user.learn_languages.where(id: language_id)
    if @knows_languages.exists?
      true
    else
      false
    end
  end
end
