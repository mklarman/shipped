class JobsController < ApplicationController

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

	def show
        @job = Job.find_by_id(params[:id])
	end

	def update
		job = Job.find_by_id(params[:id])
		if job.update(job_params)
        	redirect_to "/jobs/#{job.id}"
        else
        	render "/jobs/#{job.id}"
        end
	end	

	def destroy
		job = Job.find_by_id(params[:id])
        job.destroy
        redirect_to '/'
	end

private
    def job_params
    	params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end	

end
