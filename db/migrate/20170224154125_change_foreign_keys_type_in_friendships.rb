class ChangeForeignKeysTypeInFriendships < ActiveRecord::Migration[5.0]
  def change
  	change_column :friendships, :user_id, 'integer USING CAST(column_name AS integer)'
  	change_column :friendships, :friend_id, 'integer USING CAST(column_name AS integer)'
  end
end
