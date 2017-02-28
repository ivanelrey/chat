class User < ApplicationRecord
	has_one :profile, dependent: :destroy
	has_many :friendships
  	has_many :friends, :through => :friendships
  	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_many :languages_users
  	has_many :languages, class_name: 'Language', through: :languages_users, :source => :language
  	has_many :users_learn_languages
  	has_many :learn_languages, class_name: 'Language',  through: :users_learn_languages , :source => :language
  	has_many :visited_countries
	has_secure_password
	before_save { self.email = email.downcase }
	validates :username, presence: true, uniqueness: { case_sensitive:false }, 
			  length: { minimum:3, maximum: 25}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 105 },
			  uniqueness: {case_sensitive: false}, 
			  format: { with: VALID_EMAIL_REGEX }
	validates :password_digest, length: { minimum:6 }

end