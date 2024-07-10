class Video < ApplicationRecord
  has_many :playlist_videos, dependent: :destroy
  has_many :playlists, through: :playlist_videos
end
