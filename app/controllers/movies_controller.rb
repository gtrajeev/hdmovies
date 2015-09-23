class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # after_action :verify_autherized, :only => [:update, :create, :destroy]

  def index
    @movies = Movie.search_results(params[:query], params[:by_word]).page params[:page]
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    authorize @movie
    if @movie.save
      flash[:notice] = "Successfully created movie #{@movie.name}"
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @movie = Movie.includes(:rating, :language, :category).find params[:id]
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    authorize @movie
    if @movie.update_attributes(movie_params)
      flash[:notice] = "Successfully updated movie details."
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    authorize @movie
    @movie.destroy

    redirect_to movies_path
  end

  private

    def movie_params
      params.require(:movie)
            .permit(:name, :plot, :filetype_id, :language_id,
                    :category_id, :rating_id, :st_device, :release_year)
    end


end
