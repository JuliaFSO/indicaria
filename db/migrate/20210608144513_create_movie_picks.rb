class CreateMoviePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_picks do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.boolean :watched, default: false
      t.boolean :recommended, default: false
      t.boolean :liked, default: false
      t.boolean :liked_movie, default: false
      t.boolean :watch_list, default: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
