class SpotsController < ApplicationController
	before_action :find_spot, only: [:show, :edit, :update, :destroy]

	def index
	end

	def map
		@spot = Spot.new

		@spots = Spot.all
		@geojson = Array.new

        @spots.each do |spot|
          @geojson << {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates: [spot.longitude, spot.latitude]
          },
            properties: {
              state: spot.state,
              address: spot.address,
              description: "<strong>TEST</strong>",
              :'marker-color' => '#00607d',
              :'marker-symbol' => 'circle',
              :'marker-size' => 'medium'
            }
          }
        end

        respond_to do |format|
          format.html
          format.json { render json: @geojson }  # respond with the created JSON object
        end


	end

	def create
		@spot = Spot.new(spot_params)
		if @spot.save
			redirect_to map_path
		else
			render 'form'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @spot.update(spot_params)
			redirect_to @spot
		else
			render 'edit'
		end
	end

	def destroy
		@spot.destroy
		redirect_to root_path
	end

	private

	def spot_params
		params.require(:spot).permit(:street,:number,:city,:state,:country, :address)
	end

	def find_spot
		@spot = Spot.find(params[:id])
	end
end