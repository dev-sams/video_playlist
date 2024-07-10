class SearchVideo
  attr_accessor :params
  
  PER_PAGE = 12

  def initialize(params)
    @params = params
  end

  def results
    videos = Video.all
    videos = Video.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
    videos = videos.offset((page - 1) * PER_PAGE).limit(PER_PAGE)
    [videos, total_pages(videos)]
  end

  private

  def page
    @page ||= params.fetch(:page, 1).to_i
  end

  def total_pages(videos)
    (videos.count / PER_PAGE.to_f).ceil
  end
end
