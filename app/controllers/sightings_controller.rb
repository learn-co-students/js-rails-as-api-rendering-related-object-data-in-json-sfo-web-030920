class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location], only: [:id, :bird_id, :location_id]
  end

  def show
    sighting = Sighting.find_by(id: params[:id])
    # render json: sighting, only: [:id, :bird_id, :location_id]

    # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }

    # render json: sighting, include: [:bird, :location]

    if sighting
      render json: sighting.to_json(
        :include => {
          :bird => {only: [:id, :name, :species]}, 
          :location => {only: [:latitude, :longitude]}
        }, 
        :except => [:created_at, :updated_at])
    else 
      render json: { message: 'No sighting found with that id '}
    end
  end
end
