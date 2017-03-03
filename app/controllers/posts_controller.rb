class PostsController < ApplicationController

	def create_post
		#render plain: params[:post][:title].inspect
		Post.create(user_id: current_user.id, title: params[:post][:title], text: params[:post][:text], image: params[:post][:image])
		#redirect_to user_path(current_user)
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_user_posts_div" }
 		end
	end
end