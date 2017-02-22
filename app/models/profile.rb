class Profile < ApplicationRecord
	belongs_to :user
	GENDER_TYPES = ["Unknown","Male", "Female"]
end