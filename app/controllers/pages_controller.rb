class PagesController < ApplicationController
  before_filter :authorize, except: [:main, :show]
  def main
    @page = Page.find_by(permalink: 'main')
  end

  def show
    @page = Page.find_by(permalink: params[:permalink].split('/').last)
    @version = @page.versions.find{|p| p.version == params[:version]} if params[:version]
    @pages = @page.root.children

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  def new
    @page = Page.new
    if params[:from_page]
      parent_page = Page.where(permalink: params[:from_page]).first
      @page.parent_id = parent_page.id
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to "/#{@page.permalink}", notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to "/#{@page.permalink}", notice: 'Page was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  def update_content
    @page = Page.find(params[:page_id])
    respond_to do |format|
      if @page.update_attributes(content: params[:content], permalink: params[:permalink], title: params[:title], parent_id: params[:parent_id])
        format.js
      end
    end
  end

  def sort
    pages = params[:page]
    pp pages
    positions = pages.map {|id| Page.find(id).position }.sort

    pp positions
    pages.each_with_index do |id, index|
      puts "#{id} - #{index} - #{positions[index]}"
      Page.find(id).update_attribute(:position, positions[index])
    end
    render nothing: true
  end
end
