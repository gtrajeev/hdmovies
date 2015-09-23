class AddCategoryRefToMovies < ActiveRecord::Migration
  def change
  	add_reference :movies, :category, index: true
  end
end
