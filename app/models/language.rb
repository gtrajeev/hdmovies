class Language < ActiveRecord::Base
	has_many :movies
	include Searchable
end
Language.import
