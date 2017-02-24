class FriendshipsController < ApplicationController

	def index
		@friends =  User.find(current_user.id).friends + User.find(current_user.id).inverse_friends
		#@friends = @current_user
	end

	#def new
	#	@friendship = Friendship.new
	#end

	def create
	   #@friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
       #@friendship = 
       #params[:user_id].build_friendships(friend_id: params[:friend_id])
       if @friendship.save
       redirect_to user_path(current_user.id)
   	   end
    end
	
end