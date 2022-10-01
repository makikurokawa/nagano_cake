class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to '/admin/genres'
  end

  def index
    @genres = Genre.all
  end

  def edit
  end

  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
