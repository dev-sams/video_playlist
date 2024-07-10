class VideosController < ApplicationController
  def index
    search_service = SearchVideo.new(params)
    @videos, @total_pages = search_service.results
    @page = params.fetch(:page, 1).to_i
  end
end
