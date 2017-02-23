class Profile < ApplicationRecord
	belongs_to :user
	mount_uploader :avatar, AvatarUploader
	GENDER_TYPES = ["Unknown","Male", "Female"]
end