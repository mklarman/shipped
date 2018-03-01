class BoatsController < ApplicationController
	def index
		@boat = Boat.all
	end

	def new
		@boat =Boat.new
	end

	def create
		boat = Boat.new(boat_params)
	end

	def show
	end
	
	def edit
	end

	def update
	end

	def destroy
	end
end

 private

# def