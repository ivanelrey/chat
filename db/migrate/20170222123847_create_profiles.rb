class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :gender
    	t.date :birth_date
    	t.text :about_me
    	t.integer :user_id
    end
  end
end
