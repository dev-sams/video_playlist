namespace :fetch do
  desc "Fetch all videos from the Mock YouTube API"
  task videos: :environment do
    videos = FetchVideosService.call
    videos_data = videos.map do |video_data|
      {
        title: video_data['title'],
        video_id: video_data['video_id'],
        views: video_data['views'],
        description: video_data['description'],
        thumbnail_url: video_data['thumbnail_url'],
        created_at: Time.current,
        updated_at: Time.current
      }
    end
    Video.upsert_all(videos_data, unique_by: :video_id)
  end
end