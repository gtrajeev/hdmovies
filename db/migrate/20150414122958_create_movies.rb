class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :plot
      t.integer :release_year

      t.references :language, index: true
      t.references :rating, index: true
      t.timestamps null: false
    end
  end
end
