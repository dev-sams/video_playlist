require 'net/http'
require 'json'

class FetchVideosService
  API_BASE_URL = 'https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos'.freeze

  def self.call
    page = 1
    all_videos = []

    loop do
      url = URI("#{API_BASE_URL}?page=#{page}")
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      videos = data['videos']
      all_videos.concat(videos)
      break if videos.empty?

      page += 1
    end

    all_videos
  end
end
