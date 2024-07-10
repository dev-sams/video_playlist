class Playlist < ApplicationRecord
  has_many :playlist_videos, dependent: :destroy
  has_many :videos, through: :playlist_videos

  validates :name, presence: true
end
