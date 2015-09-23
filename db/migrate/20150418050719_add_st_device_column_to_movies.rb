class AddStDeviceColumnToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :st_device, :string
  end
end
