class CreateVisitedCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :visited_countries do |t|
    	t.integer :user_id
    	t.string :country
    end
  end
end
