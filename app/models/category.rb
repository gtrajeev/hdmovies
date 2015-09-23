class Category < ActiveRecord::Base
	has_many :movies
	include Searchable
end
Category.import
