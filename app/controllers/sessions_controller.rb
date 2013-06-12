class SessionsController < ApplicationController
  def new
  end

  def create
    session[:login] = params[:session][:login]
    session[:password] = params[:session][:password]
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
