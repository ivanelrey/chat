class Language < ApplicationRecord
	has_many :languages_users
  	has_many :users, class_name: 'User', through: :languages_users, :source => :user
  	has_many :users_learn_languages
  	has_many :learn_users, class_name: 'User', through: :users_learn_languages, :source => :user
end