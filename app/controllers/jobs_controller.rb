class JobsController < ApplicationController



# def create
# 	job = Job.new(job_params)
# 	if(job.cost < 100)
# 	flash[:message] = 'All Jobs Must Cost Min $100'
# end



def show
        @job = Job.find_by_id(params[:id])
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

private
    def job_params
    	params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end	

end
