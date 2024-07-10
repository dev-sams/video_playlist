class VideosController < ApplicationController
  def index
    @page = params.fetch(:page, 1).to_i
    @per_page = 12
    @videos = Video.offset((@page - 1) * @per_page).limit(@per_page)
    @total_pages = (Video.count / @per_page.to_f).ceil
  end
end
