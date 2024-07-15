class PlaylistVideo < ApplicationRecord
  belongs_to :playlist
  belongs_to :video

  validates :video_id, uniqueness: { scope: :playlist_id, message: "has already been added to this playlist" }
end
