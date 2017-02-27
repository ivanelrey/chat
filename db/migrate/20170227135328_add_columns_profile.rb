class AddColumnsProfile < ActiveRecord::Migration[5.0]
  def change
  	add_column :profiles, :from_country, :string
  	add_column :profiles, :last_location, :string
  end
end
