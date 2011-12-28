class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username],
                 params[:password],
                 params[:remember_me])
    if user
      redirect_back_or_to root_url
    else
      flash.now[:error] = "Login Failed: Incorrect Creds."
      render :new
    end
  end

  def destroy
    redirect_to(root_path) unless current_user
    logout
    redirect_to root_url
  end

end
