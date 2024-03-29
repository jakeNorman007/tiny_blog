class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in sucessfully."
      redirect_to user
    else
      flash.now[:alert] = "Something went wrong with your log in details!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out sucessfully."
    redirect_to root_path
  end
end