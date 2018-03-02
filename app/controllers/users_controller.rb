class UsersController < ApplicationController

  def show
    @page_user = User.find_by_id(params[:id])

    @page_user_jobs = []

    @page_user.boats.each do |ea_boat|
      ea_boat.jobs.each do |ea_job|
        @page_user_jobs.push(ea_job)
      end
    end
    @page_user_jobs = @page_user_jobs.uniq

  end


end
