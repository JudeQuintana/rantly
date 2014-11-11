class SearchController < ApplicationController

  def index
    @search = Search.new(params[:search])
  end

  def show
  end

end