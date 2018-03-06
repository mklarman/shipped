class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def show
    unless user_signed_in?
      redirect_to root_path
    end
    
    # if show doesn't have ID, try to load id from current_user
    if params[:id].nil? 
      @page_user = current_user
    else
      @page_user = User.find_by_id(params[:id])
    end
    
    

    # If user for page exists, show his boats    

    if (!!@page_user)
      @page_user_jobs = []
      @page_user.boats.each do |ea_boat|
        ea_boat.jobs.each do |ea_job|
          @page_user_jobs.push(ea_job)
        end
      end
      @page_user_jobs = @page_user_jobs.uniq
    else
        # redirect_to root_path
    end

  end

end
