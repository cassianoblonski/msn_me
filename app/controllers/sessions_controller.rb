class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  def new

  end

  def create
    user = User.find_by('email = :nick or username = :nick', nick: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to login_path
  end

  private
    def logged_in_redirect
      redirect_to root_path if logged_in?
    end
end
