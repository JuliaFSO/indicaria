class AddColumnToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :id_apimovie, :integer
    add_column :movies, :provider_name, :string
    add_column :movies, :provider_logo, :string

    remove_column :movies, :director
    remove_column :movies, :actor
  end
end
