# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies or /movies.json
  def index
    @movies = MovieFilter.retrieve_all
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit; end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if MovieService.save(@movie)
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if MovieService.update(@movie, movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    MovieService.delete(@movie)

    respond_to do |format|
      format.html { redirect_to movies_path, status: :see_other, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  private

  def set_movie
    @movie = MovieFilter.search_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:title, :director, :release_date, photos: []) # :description
  end

  def destroy_photo
    @movie = Movie.find(params[:id])
    photo = @movie.photos.find_by_id(params[:photo_id])
    photo.purge # Remove a foto do Active Storage
    redirect_to movie_path(@movie), notice: 'Foto removida com sucesso.'
  end
end
