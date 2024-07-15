class VideosController < ApplicationController
  def index
    @page = params.fetch(:page, 1).to_i
    search_service = SearchVideo.new(params)
    @videos, @total_pages = search_service.results
  end

  def playlists
    video = Video.includes(:playlists).find(params[:id])
    playlists = Playlist.all.map do |playlist|
      {
        id: playlist.id,
        name: playlist.name,
        included: video.playlists.include?(playlist)
      }
    end
    render json: { playlists: playlists }
  end

  def update_playlists
    video = Video.find(params[:id])
    playlist_ids = params[:playlists].map(&:to_i)

    if video.update(playlists: Playlist.where(id: playlist_ids))
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end
end
