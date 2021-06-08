class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.float :vote_average
      t.integer :release_year
      t.integer :runtime
      t.string :genre
      t.string :director
      t.text :actor
      t.string :language
      t.string :country
      t.string :poster_url
      t.string :trailer_url

      t.timestamps
    end
  end
end
