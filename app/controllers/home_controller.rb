class HomeController < ApplicationController
  def index
  	@movies = Movie.not_copied.includes(:language, :category)
  	@recent_movies = Movie.recent.includes(:language, :category)
  end
end
