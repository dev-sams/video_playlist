require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe "GET #index" do
    before do
      @video = create(:video)
      get :index
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET #playlists" do
    let(:video) { create(:video) }
    let!(:playlists) { create_list(:playlist, 3) }

    before do
      video.playlists << playlists.sample # Associate the video with a random playlist
      get :playlists, params: { id: video.id }
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "renders playlists in JSON format" do
      json_response = JSON.parse(response.body)
      expect(json_response['playlists'].size).to eq(3)
      expect(json_response['playlists'].map { |p| p['id'] }).to include(*playlists.map(&:id))
    end
  end

  describe "POST #update_playlists" do
    let(:video) { create(:video) }
    let!(:playlists) { create_list(:playlist, 3) }

    before do
      video.playlists << playlists.first
    end

    context "with valid playlist ids" do
      it "updates the video playlists" do
        post :update_playlists, params: { id: video.id, playlists: [playlists.second.id] }
        video.reload
        expect(video.playlists).to include(playlists.second)
        expect(video.playlists).not_to include(playlists.first)
      end

      it "returns a success response" do
        post :update_playlists, params: { id: video.id, playlists: [playlists.second.id] }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['success']).to be(true)
      end
    end
  end
end
