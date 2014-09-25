class CreateMovieVotes < ActiveRecord::Migration
  def up
    create_table :movie_votes do |t|
      t.references :user
      t.references :movie
      t.boolean :like
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE movie_votes
        ADD CONSTRAINT fk_movie_votesA
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    SQL
    execute <<-SQL
      ALTER TABLE movie_votes
        ADD CONSTRAINT fk_movie_votesB
        FOREIGN KEY (movie_id)
        REFERENCES movies(id)
    SQL
    add_index(:movie_votes, [:user_id, :movie_id], :unique => true)
  end

   def down
    drop_table :movie_votes
  end
end
