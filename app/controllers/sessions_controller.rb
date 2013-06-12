class SessionsController < ApplicationController
  def new
  end

  def create
    session[:login] = params[:login]
    session[:password] = params[:password]
    if authorize
      flash[:notice] = 'Successfully logged in'
      redirect_to root_path
    else

    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end
end
