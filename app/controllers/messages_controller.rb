class MessagesController < ApplicationController 

	def show
		@messages = current_user.messages.where(receiver_id: params[:id]) + current_user.inverse_messages.where(user_id: params[:id])
		@messages = @messages.sort_by{|e| e[:created_at]}
		@receiver_id = params[:id]
		@user = User.find(current_user.id)
	end


	def create
		#render plain: params[:message].inspect
		message = Message.create(user_id: current_user.id, receiver_id: params[:message][:receiver_id], text: params[:message][:text])
		#@conversation = current_user.messages.where(receiver_id: params[:message][:receiver_id]) + current_user.inverse_messages.where(user_id: params[:message][:receiver_id])
		#@conversation = @conversation.sort_by{|e| e[:created_at]}
		@receiver_id = current_user.id
		
 		ActionCable.server.broadcast "chat", {
 			message: MessagesController.render(
 				partial: 'message',
 				locals: { message: message }
 			).squish
 		}
	end
end