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
			redirect_to "/boats"
		else
			redirect_to new_boat_path
		end	
	end

	def show
		@boat = Boat.find(params[:id])
		@jobs = Job.all
	end
	
	def edit
	end

	def update
	end

	def destroy
	end


    def assign
    	@job = Job.find(params[:id])
		@boat = Boat.find(params[:boat_id])
		if @job.boats.find_by_id(@boat.id)
            flash[:message] = 'this boat has been assigned'
            redirect_to "/jobs/#{@job.id}"
		else
			@job.boats << @boat
			redirect_to "/jobs/#{@job.id}"
		end	
    end	

 private

 def boat_params
 	params.require(:boat).permit(:name, :capacity, :location, :avatar, :user_id)
 end
end

