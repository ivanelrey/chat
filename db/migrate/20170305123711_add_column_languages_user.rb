class AddColumnLanguagesUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :languages_users, :action, :string
  end
end
