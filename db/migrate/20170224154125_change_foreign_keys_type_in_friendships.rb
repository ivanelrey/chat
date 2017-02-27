class ChangeForeignKeysTypeInFriendships < ActiveRecord::Migration[5.0]
  def change
  	change_column :friendships, :user_id, 'integer USING CAST(user_id AS integer)'
  	change_column :friendships, :friend_id, 'integer USING CAST(friend_id AS integer)'
  end
end
