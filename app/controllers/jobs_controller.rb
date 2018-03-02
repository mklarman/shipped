class JobsController < ApplicationController
def show
        @job = Job.find_by_id(params[:id])
        @boats= Boat.all
end

def update
	job = Job.find_by_id(params[:id])
	if(job_params[:cost].to_i < 100)
		flash[:message] = 'All Jobs Must Cost Min $100'
		redirect_to "/jobs/#{job.id}"
	elsif (job_params[:description].length < 20)
		flash[:message] = 'You description need to have at least 20 charactors'
		redirect_to "/jobs/#{job.id}"	 	
	else	
		if job.update(job_params)	
        flash[:message] = 'updated successfully'
        redirect_to "/jobs/#{job.id}"
        else
        	render "/jobs/#{job.id}"
        end
    end    
end	

def destroy
    job = Job.find_by_id(params[:id])
    job.destroy
    redirect_to '/'
end

def index
  # @job = Job.all
end

def create
job = Job.new(job_params)
   if(job_params[:cost].to_f < 100)
    puts 'All Jobs Must Cost Min $100'
    redirect_to "/jobs" and return
   end
   if(job.description.length < 20)
    puts 'Descriptions must be longer than 20 characters'
    redirect_to "/jobs" and return
   end
   if job.save!

    redirect_back(fallback_location: jobs_path)
   end
end
 

private
    def job_params
    	params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end	

end
