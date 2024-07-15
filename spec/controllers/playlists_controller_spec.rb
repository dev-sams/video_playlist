require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  describe "GET #index" do
    before do
      @playlist = create(:playlist)
      get :index
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    before { get :new }

    it "returns a successful response" do
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) { { name: "My Playlist" } }

      it "creates a new Playlist" do
        expect {
          post :create, params: { playlist: valid_attributes }
        }.to change(Playlist, :count).by(1)
      end

      it "redirects to the playlists index" do
        post :create, params: { playlist: valid_attributes }
        expect(response).to redirect_to(playlists_path)
      end

      it "sets a flash notice" do
        post :create, params: { playlist: valid_attributes }
        expect(flash[:notice]).to eq('Playlist was successfully created.')
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { name: "" } }

      it "does not create a new Playlist" do
        expect {
          post :create, params: { playlist: invalid_attributes }
        }.not_to change(Playlist, :count)
      end
    end
  end
end
