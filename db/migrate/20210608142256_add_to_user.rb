class AddToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :favorite_genres, :string
    add_column :users, :favorite_movies, :string
  end
end
