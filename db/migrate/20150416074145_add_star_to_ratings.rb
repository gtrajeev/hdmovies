class AddStarToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :star, :float
  end
end
