class Message < ApplicationRecord
	belongs_to :user
  	belongs_to :receiver, :class_name => 'User'
  	#after_create_commit {
  	#	ActionCable.server.broadcast "chat", {
 	#		message: MessagesController.render(
 	#			partial: 'message',
 	#			locals: { message: message }
 	#		).squish
 	#	}
  	#}
  	after_create_commit { MessageBroadcastJob.perform_later(self) }
end