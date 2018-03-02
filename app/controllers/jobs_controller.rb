class JobsController < ApplicationController



def create


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
