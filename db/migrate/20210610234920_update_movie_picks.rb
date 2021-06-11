class UpdateMoviePicks < ActiveRecord::Migration[6.0]
  def change
    rename_column :movie_picks, :accepted, :refused
    
    remove_column :movie_picks, :liked
    remove_column :movie_picks, :liked_movie
  end
end
