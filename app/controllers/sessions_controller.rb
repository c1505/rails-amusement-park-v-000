class SessionsController < ApplicationController


  def new
  end

  def create
    session[:user_id] = params[:user][:id]
    user = User.find(params[:user][:id])
    redirect_to user
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
