class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/:id
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/:id/edit
  def edit
  end

  # POST /movies
  def create
    @movie = Movie.new( movie_params )

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH|PUT /movies/:id
  def update
    if @movie.update( movie_params )
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find( params[:id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require( :movie ).permit( :title, :description, :length, :director, :rating )
    end
end
