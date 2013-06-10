class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_pages

  private

  def get_pages
    @pages = Page.ne(permalink: 'main')
  end
end
