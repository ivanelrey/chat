class FriendshipsController < ApplicationController

	def index
		@friends =  User.find(current_user.id).friends + User.find(current_user.id).inverse_friends
	end

	def create
	   @friendship = Friendship.new(user_id: params[:user_id], friend_id: params[:friend_id])
       if @friendship.save
       redirect_to user_path(current_user.id)
   	   end
    end

    def update_friendship
    	@friendship = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id)
    	#@friendship = Friendship.find()
    	if @friendship.update(confirmed: true)
    	#if @friendship.update
    	redirect_to user_path(current_user.id)
    	end
    end

end