
require 'rails_helper'
require 'webmock/rspec'

RSpec.describe FetchVideosService do
  describe '.call' do
    before do
      stub_request(:get, "https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos?page=1")
        .to_return(
          status: 200,
          body: { videos: [{ id: 1, title: 'Video 1' }, { id: 2, title: 'Video 2' }] }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )

      stub_request(:get, "https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos?page=2")
        .to_return(
          status: 200,
          body: { videos: [] }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
    end

    it 'fetches all videos from the API' do
      videos = FetchVideosService.call

      expect(videos).to eq([
        { 'id' => 1, 'title' => 'Video 1' },
        { 'id' => 2, 'title' => 'Video 2' }
      ])
    end

    it 'makes multiple API calls if there are more videos' do
      FetchVideosService.call

      expect(WebMock).to have_requested(:get, "https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos?page=1").once
      expect(WebMock).to have_requested(:get, "https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api/videos?page=2").once
    end
  end
end
