class HomeController < ApplicationController
  def index
  	@movies = Movie.not_copied
  	@recent_movies = Movie.recent
  end
end
