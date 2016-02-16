class JobsController < ApplicationController

  def index
    # shows apply pipeline for logged in user
    user = User.find(session[:current_user_id])
    @user = User.find(user)
    @full_name = @user.first_name + " " + @user.last_name

    # get all jobs associated with user
    @new_jobs = Job.where(status: "new").where(user_id: session[:current_user_id]).order('created_at DESC')
    @applied_jobs = Job.where(status: "applied").where(user_id: session[:current_user_id]).order('created_at DESC')
    @responses = Job.where(status: "response").where(user_id: session[:current_user_id]).order('created_at DESC')

    #get notes associated with response jobs
    @response_notes = Note.where(user_id: session[:current_user_id])
  end

  def add
    Job.create(user_id: session[:current_user_id], title: params["title"], company: params["company"], location: params["location"], link: params["link"], description: params["description"], status: "new")
    redirect_to '/welcome'
  end

  def update
    job = Job.find(params[:id])
    job.update_attributes(title: params["title"], company: params["company"], location: params["location"], link: params["link"], description: params["description"])
    redirect_to "/welcome"
  end

  def sent
    job = Job.find(params[:id])
    job.update_attribute(:status, "applied")
    redirect_to "/welcome"
  end

  def received
    Note.create(user_id: session[:current_user_id], job_id: params[:id], content: params["response_note"])

    job = Job.find(params[:id])
    job.update_attribute(:status, "response")
    redirect_to "/welcome"
  end

  def next
    job = Job.find(params[:id])
    job.update_attribute(:status, "response")
    redirect_to "/welcome"
  end

  ###########################
    # All go back methods
  ##########################
  def backtrack
    job = Job.find(params[:id])
    status = job[:status]
    if status == "interview"
      job.update_attribute(:status, "response")
    elsif status == "response"
      job.update_attribute(:status, "applied")
    elsif status == "applied"
      job.update_attribute(:status, "new")
    end
    redirect_to "/welcome"
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to '/welcome'
  end

end
