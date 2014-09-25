class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.references :user
    	t.string "title", :limit =>40, :null =>false
    	t.text "description", :null =>false
      t.timestamps
    end
    # add a foreign key
    execute <<-SQL
      ALTER TABLE movies
        ADD CONSTRAINT fk_movies
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    SQL
    add_index("movies","user_id")
  end

  def down
    drop_table :movies
  end
end
