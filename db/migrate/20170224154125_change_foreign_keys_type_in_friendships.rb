class ChangeForeignKeysTypeInFriendships < ActiveRecord::Migration[5.0]
  def change
  	change_column :friendships, :user_id, :integer
  	change_column :friendships, :friend_id, :integer
  end
end
