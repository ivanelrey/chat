class MessagesController < ApplicationController 

	def show
		@conversation = current_user.messages.where(receiver_id: params[:id]) + current_user.inverse_messages.where(user_id: params[:id])
		@conversation = @conversation.sort_by{|e| e[:created_at]}
		@receiver_id = params[:id]
	end


	def create
		#render plain: params[:message].inspect
		Message.create(user_id: current_user.id, receiver_id: params[:message][:receiver_id], text: params[:message][:text])
		respond_to do |format|
    		format.js { render :action => "refresh_conversation" }
 		end
	end
end