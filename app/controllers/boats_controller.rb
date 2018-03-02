class BoatsController < ApplicationController
	def index
		@boats = Boat.all
	end

	def new
		@boat =Boat.new
	end

	def create
		boat = Boat.new(boat_params)
		if boat.save
			redirect_to root_path
		else
			redirect_to new_boat_path
	end

	def show
		@boat = Boat.find(params [:id])
		@jobs = Job.all
	end
	
	def edit
	end

	def update
	end

	def destroy
	end
end

 private

 def boat_params
 	params.require(:boat).permit(:name, :capacity, :location, :user_id)
 end
end