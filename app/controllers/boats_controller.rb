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
      flash[:message] = 'New ship added'
			redirect_back(fallback_location: root_path)
    else
      flash[:message] = 'New ship not added'
			redirect_back(fallback_location: root_path)
		end	
	end

	def show
		@boat = Boat.find_by_id(params[:id])
		@jobs = Job.all
	  # @boat = Boat.find_by_id(params[:id])
	end
	
	def edit
		@boat = Boat.find_by_id(params[:id])
		
	end

	def update
		@boat = Boat.find_by_id(params[:id])
		@boat = Boat.update
	end

	def destroy
		this_boat = Boat.find_by_id(params[:id])
		this_boat.destroy
		redirect_to root_path
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

