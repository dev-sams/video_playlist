require 'rails_helper'
require 'rake'

RSpec.describe 'fetch:videos' do
  # (Optional) Consider adding a helper method to create sample videos
  def create_sample_videos(data)
    Video.upsert_all(data)
  end

  let(:video_data) do
    [
      { 'title' => 'Video 1', 'video_id' => '1', 'views' => 100, 'description' => 'Description 1', 'thumbnail_url' => 'url1' },
      { 'title' => 'Video 2', 'video_id' => '2', 'views' => 200, 'description' => 'Description 2', 'thumbnail_url' => 'url2' }
    ]
  end

  context 'using actual FetchVideosService' do
    before :all do
      Rake.application.load_rakefile
    end

    before do
      allow(FetchVideosService).to receive(:call).and_return(video_data)
    end

    it 'fetches videos and upserts them into the database (with API call)' do
      expect {
        Rake::Task['fetch:videos'].invoke
      }.to change { Video.count }.by(2)

      expect(Video.pluck(:video_id)).to contain_exactly('1', '2')
    end
  end

  context 'using pre-defined data (for unit testing)' do
    it 'fetches videos and upserts them into the database (without API call)' do
      create_sample_videos(video_data) # Use helper method or direct upsert

      expect(Video.count).to eq(2)
      expect(Video.pluck(:video_id)).to contain_exactly('1', '2')
    end
  end
end