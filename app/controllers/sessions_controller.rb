class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_to root_url, :notice => "Logged in!"
    else
      redirect_to root_url, :notice => "wrong pw or email"
      #flash.now.alert = "Email or password was invalid."
    end
  end

  def destroy
  	logout
  	redirect_to root_url, :notice => "Logged out!"
	end
end