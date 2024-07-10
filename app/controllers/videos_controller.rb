class VideosController < ApplicationController
  def index
    search_service = SearchVideo.new(params)
    @videos, @total_pages = search_service.results
    @page = params.fetch(:page, 1).to_i
    @playlists = Playlist.all
  end

  def add_to_playlist
    video = Video.find(params[:id])
    playlist = Playlist.find(params[:playlist_id])

    if playlist.videos.include?(video)
      flash[:notice] = "Video '#{video.title}' is already in playlist '#{playlist.name}'."
    else
      playlist.videos << video
      flash[:success] = "Video '#{video.title}' added to playlist '#{playlist.name}'."
    end

    redirect_back(fallback_location: root_path)
  end

  def remove_from_playlist
    video = Video.find(params[:id])
    playlist = Playlist.find(params[:playlist_id])

    if playlist.videos.include?(video)
      playlist.videos.delete(video)
      flash[:success] = "Video '#{video.title}' removed from playlist '#{playlist.name}'."
    else
      flash[:notice] = "Video '#{video.title}' is not in playlist '#{playlist.name}'."
    end

    redirect_back(fallback_location: root_path)
  end
end