class JobsController < ApplicationController


def create


end



private
    def job_params
        params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end




end
