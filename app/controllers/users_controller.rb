class UsersController < ApplicationController

  def index
    # show registration / login page
    @home_page = true
  end

  def create
    # make sure passwords match
    user = User.create(user_params)
    if user.errors.any?
      flash[:req_errors] = user.errors.full_messages
      redirect_to "/"
    else
      flash[:success] = ["Registration successful. Please log in."]
      redirect_to "/welcome"
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to '/welcome'
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to "/"
    end
  end

  def logout
    reset_session
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
