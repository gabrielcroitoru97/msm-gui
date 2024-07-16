Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director_record", { :controller => "directors", :action => "post" })
  get("/delete_director/:director_id", { :controller => "directors", :action => "destroy" })
  post("/change_director_record/:director_id", { :controller => "directors", :action => "change" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie_record", { :controller => "movies", :action => "post" })
  get("/delete_movie/:movie_id", { :controller => "movies", :action => "destroy" })
  post("/change_movie_record/:movie_id", { :controller => "movies", :action => "change" })
  


  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor_record", { :controller => "actors", :action => "post" })
  get("/delete_actor/:actor_id", { :controller => "actors", :action => "destroy" })
  post("/change_actor_record/:actor_id", { :controller => "actors", :action => "change" })
end
