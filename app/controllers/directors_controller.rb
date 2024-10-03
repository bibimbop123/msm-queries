class DirectorsController < ApplicationController
  def index
    render ({:template => "/director_templates/list"})
  end


  def young

    @the_youngest_director = Director.order(dob: :desc).first

   
    if @the_youngest_director.nil?
      render plain: "No directors found", status: :not_found
    else
   render({:template => "director_templates/youngest"})
    #end
  end
end

  def elder 
    @the_eldest_director = Director.order(dob: :asc).first

   
    if @the_eldest_director.nil?
      render plain: "No directors found", status: :not_found
    else
   render({:template => "director_templates/eldest"})
    #end
  end
end


  def show
    the_id = params.fetch("the_id")

    director = Director.where({:id=>the_id})

    @the_director = director.first
    
    render({template: "director_templates/details"})
  end

end
