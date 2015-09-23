class Rating < ActiveRecord::Base
	has_many :movies
	include Searchable
end
Rating.import
