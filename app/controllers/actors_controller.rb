class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
  def post


    @new_actor=Actor.new
    @new_actor.name=params.fetch("the_name")
    @new_actor.dob=params.fetch("the_dob")
    @new_actor.bio=params.fetch("the_bio")
    @new_actor.image=params.fetch("the_image")
    @new_actor.save

    redirect_to("/actors")
 
  end

  def destroy
    actor_id=params.fetch("actor_id")
    match_list = Actor.where({:id=>actor_id})
    matching_actor = match_list.at(0)
    matching_actor.destroy
    redirect_to("/actors")
  end

  def change
    actor_id=params.fetch("actor_id")
    match_list = Actor.where({:id=>actor_id})
    @matching_actor = match_list.at(0)

    @matching_actor.name=params.fetch("the_name")
    @matching_actor.dob=params.fetch("the_dob")
    @matching_actor.bio=params.fetch("the_bio")
    @matching_actor.image=params.fetch("the_image")
    @matching_actor.save
    redirect_to("/actors/#{actor_id}")
    
  end


end
