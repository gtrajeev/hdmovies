class Filetype < ActiveRecord::Base
	has_many :movies
	include Searchable
end
Filetype.import
