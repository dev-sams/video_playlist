require 'rails_helper'

RSpec.describe SearchVideo do
  let!(:video1) { create(:video, title: 'First Video') }
  let!(:video2) { create(:video, title: 'Second Video') }
  let!(:video3) { create(:video, title: 'Third Video') }
  let!(:playlist) { create(:playlist) }
  let!(:playlist_video) { create(:playlist_video, playlist: playlist, video: video1) }

  describe '#results' do
    context 'when no parameters are given' do
      it 'returns all videos' do
        search_service = SearchVideo.new({})
        videos, total_pages = search_service.results

        expect(videos).to match_array([video1, video2, video3])
        expect(total_pages).to eq(1)
      end
    end

    context 'when searching by title' do
      it 'returns videos matching the title' do
        search_service = SearchVideo.new(title: 'First')
        videos, total_pages = search_service.results

        expect(videos).to match_array([video1])
        expect(total_pages).to eq(1)
      end

      it 'returns no videos if no match is found' do
        search_service = SearchVideo.new(title: 'Non-existent')
        videos, total_pages = search_service.results

        expect(videos).to be_empty
        expect(total_pages).to eq(0)
      end
    end

    context 'when filtering by playlist' do
      it 'returns videos in the specified playlist' do
        search_service = SearchVideo.new(playlist_id: playlist.id)
        videos, total_pages = search_service.results

        expect(videos).to match_array([video1])
        expect(total_pages).to eq(1)
      end

      it 'returns no videos if playlist has no videos' do
        empty_playlist = create(:playlist)
        search_service = SearchVideo.new(playlist_id: empty_playlist.id)
        videos, total_pages = search_service.results

        expect(videos).to be_empty
        expect(total_pages).to eq(0)
      end
    end

    context 'when paginating results' do
      it 'returns a limited number of videos per page' do
        search_service = SearchVideo.new(page: 1)
        videos, total_pages = search_service.results

        expect(videos.size).to eq(3)
        expect(total_pages).to eq(1)

        search_service = SearchVideo.new(page: 2)
        videos, total_pages = search_service.results

        expect(videos).to be_empty
        expect(total_pages).to eq(1)
      end
    end
  end
end
