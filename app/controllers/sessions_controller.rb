class SessionsController < ApplicationController

  def new

  end

  def create
    # user = User.find_by(username: params[:session][:username].downcase)
    # user = User.find_by(email: params[:session][:email].downcase)

    user = User.find_by(email?)

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
    def email?
      email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if params[:session][:username].downcase.match(email_regex)
        {email: params[:session][:username].downcase}
      else
        {username: params[:session][:username].downcase}
      end
    end
end
