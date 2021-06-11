class UpdateMoviePicksReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :movie_picks, :users, null: false, foreign_key: true
    remove_reference :movie_picks, :movies, null: false, foreign_key: true

    add_reference :movie_picks, :user, null: false, foreign_key: true
    add_reference :movie_picks, :movie, null: false, foreign_key: true
  end
end
