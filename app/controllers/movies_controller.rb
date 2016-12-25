class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /movies
  # =link_to .. movies_path
  def index
    @movies = Movie.all
  end
  # Automatically render 'index' (views/movies/index.html.haml)

  # GET /movies/new
  # =link_to .. new_movie_path
  def new
    @movie = current_user.movies.new
  end
  # Automatically render 'new' (which renders _form)

  # POST /movies
  # =form_for @movie ..       .new_record? == true => url: '/movies', method: :post
  def create
    @movie = current_user.movies.new( movie_params )

    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render 'new'
    end
  end

  # GET /movies/:id
  # =link_to .. @movie | movie_path( @movie )
  def show
  end
  # Automatically render 'show'

  # GET /movies/:id/edit
  # =link_to .. edit_movie_path( @movie )
  def edit
  end
  # Automaticall render 'edit' (which renders _form)

  # PATCH|PUT /movies/:id
  # =form_for @movie ..       .new_record? == false => url: '/movies/:id', method: :patch
  def update
    if @movie.update( movie_params )
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /movies/:id
  # =link_to .. @movie | movie_path( @movie ), method: :delete
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
      params.require( :movie ).permit( :title, :description, :length, :director, :rating, :image )
    end
end
