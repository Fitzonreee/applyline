class JobsController < ApplicationController

  def index
    # shows apply pipeline for logged in user
    user = User.find(session[:current_user_id])
    @user = User.find(user)
    @full_name = @user.first_name + " " + @user.last_name

    # get all jobs associated with user
  end

  def show
    # click on job to view details
  end

end
