class CreateLearningLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :users_learn_languages, id: false do |t|
    	t.references :user, :language
    end

    add_index :users_learn_languages, [:user_id, :language_id],
     	name: "users_learn_languages_index",
      	unique: true
  end
end
