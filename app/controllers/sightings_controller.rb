class SightingsController < ApplicationController
    
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
        
    
    
    end
    
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting
    #     render json: {
    #         id: sighting.id, 
    #         bird: sighting.bird.name, 
    #         location: sighting.location
    # }

    if sighting
            
        render json: sighting, include: [:bird, :location]
    else
        render json: {message: 'No sighting found with that id'}
        #remember that each instance of a model has error messages associated with it in params
    end
    
    end


end


# For example, to also remove all instances of :created_at and :updated_at from the nested bird and location data in the above example, we'd have to add nesting into the options, so the included bird and location data can have their own options listed. Using the fully written to_json render statement can help keep things a bit more readable here: