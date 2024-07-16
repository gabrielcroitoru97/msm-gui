class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def post


    @new_movie=Movie.new
    @new_movie.title=params.fetch("the_title")
    @new_movie.year=params.fetch("the_year")
    @new_movie.duration=params.fetch("the_duration")
    @new_movie.description=params.fetch("the_description")
    @new_movie.image=params.fetch("the_image")
    @new_movie.director_id=params.fetch("the_director_id")
    @new_movie.save

    redirect_to("/movies")
 
  end
  def destroy
    movie_id=params.fetch("movie_id")
    match_list = Movie.where({:id=>movie_id})
    matching_movie = match_list.at(0)
    matching_movie.destroy
    redirect_to("/movies")
  end

end
