class JobsController < ApplicationController


def create
	job = Job.new(job_params)
	if(job.cost < 100)


end



private
    def job_params
        params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end




end
