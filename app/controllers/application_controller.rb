class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_pages

  private

  def get_pages
    @pages = Page.all_without_main
  end

  def admin?
    session[:password] == 'secret'
  end
  helper_method :admin?

  def authorize
    unless admin?
      flash[:alert] = 'Unauthorized'
      redirect_to root_path
      false
    end
  end
end
