class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_pages

  protected

  def get_pages
    @pages = Page.all_without_main
  end

  def admin?
    session[:login] == 'admin' && session[:password] == 'secret'
  end
  helper_method :admin?

  def authorize
    if admin?
      true
    else
      flash[:alert] = 'Unauthorized'
      redirect_to root_path
      false
    end
  end
end
