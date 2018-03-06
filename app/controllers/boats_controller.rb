class BoatsController < ApplicationController
	def index
		@boats = Boat.all
	end

	def new
		@boat =Boat.new
	end

	def create
		myboat = Boat.new(boat_params)
    if myboat.save
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
    #  redirects user out if not signed in
    unless user_signed_in?
      redirect_to root_path
    end

    @page_boat = Boat.find_by_id(params[:id])
    

    
	end

	def update
		current_boat = Boat.find_by_id(params[:id])

    #  checking for rules
    # unique name
    given_name = boat_params[:name]
    boat_that_was_found = Boat.find_by_name(given_name)
    if (!!boat_that_was_found)
      if !(boat_that_was_found.id == current_boat.id)
        flash[:message] = 'Name already exists, must be unique!'
        redirect_back(fallback_location: root_path)
        return
      end
    end
    
    

    if (given_name.length <= 0)
      flash[:message] = 'Name must have at least 1 character!'
      redirect_back(fallback_location: root_path)
      return
    end


    current_boat.update(boat_params)	
    flash[:message] = 'Ship updated'
    redirect_back(fallback_location: root_path)
    
	end

	def destroy
		this_boat = Boat.find_by_id(params[:id])
    this_boat.destroy
    flash[:message] = 'Ship erased'
		redirect_to root_path

# 		if boat.update(boat_params)
#         	redirect_to "/boats/#{boat.id}"
#         else
#         	render "/boats/#{boat.id}"
#         end
# 	end	

# 	def destroy

# 		@boat = Boat.find_by_id(params[:id])
# 		@boat.destroy
# 		redirect_to '/boats'

	end

# 		boat = Boat.find_by_id(params[:id])
#         bob.destroy
#         redirect_to '/boats'
#     end



  def assign
    @job = Job.find_by_id(params[:id])
    @boat = Boat.find_by_id(params[:boat_id])
    if @job.boats.find_by_id(@boat.id)
      flash[:message] = 'This ship already assigned'
      # redirect_to "/jobs/#{@job.id}"
      redirect_back(fallback_location: root_path)
    else
      @job.boats << @boat
      flash[:message] = 'This ship is now assigned'
      # redirect_to "/jobs/#{@job.id}"
      redirect_back(fallback_location: root_path)
    end	
  end

  def unassign
  	job = Job.find_by_id(params[:id])
    boat = Boat.find_by_id(params[:boat_id])
    job.boats.delete(boat) if boat
    redirect_to "/jobs/#{job.id}"
  end 	

 private

  def boat_params
    params.require(:boat).permit(:name, :capacity, :location, :avatar, :user_id)
  end
end

