class Movie < ActiveRecord::Base
  searchkick

  include Searchable
  paginates_per 25
  belongs_to :rating
  belongs_to :language
  belongs_to :filetype
  belongs_to :category
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres, dependent: :destroy

  validates_uniqueness_of :name, :scope => :language_id

  scope :not_copied, -> { where("st_device='Laptop'") }
  scope :recent, -> { where("DATE(updated_at) > CURDATE() - INTERVAL 30 DAY") }


  def self.search_results(query, word_search)
  	if query.nil? or query.blank?
      movies = self.all.order(name: :asc)
    else
      if (word_search=="on")
        movies = self.search query
      else
        wild_card_query = "#{query}%"
        movies = Movie.where('name LIKE?', wild_card_query)
      end
    end
    movies
  end
end
# Index all Movie records from the DB to Elasticsearch
Movie.import
