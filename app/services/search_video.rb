class SearchVideo
  attr_accessor :params
  
  PER_PAGE = 12

  def initialize(params)
    @params = params
  end

  def results
    videos = Video.all
    videos = videos.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
    if params[:playlist_id].present?
      playlist = Playlist.find(params[:playlist_id])
      videos = playlist.videos.where(id: videos.pluck(:id))
    end
    total_videos = videos.count
    videos = videos.offset((page - 1) * PER_PAGE).limit(PER_PAGE)
    [videos, (total_videos / PER_PAGE.to_f).ceil]
  end

  private

  def page
    @page ||= params.fetch(:page, 1).to_i
  end
end
