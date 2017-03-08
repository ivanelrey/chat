class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
    	t.integer :user_id
    	t.integer :receiver_id
    	t.text :text
    	t.timestamps
    end
  end
end
