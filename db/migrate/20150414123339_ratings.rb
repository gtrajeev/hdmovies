class Ratings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
  	  t.string :title

  	  t.timestamps null: false
  	end
  end
end
