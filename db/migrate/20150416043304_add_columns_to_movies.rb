class AddColumnsToMovies < ActiveRecord::Migration
  def change
  	add_reference :movies, :filetype, index: true
  	add_column :movies, :duration, :float
  end
end
