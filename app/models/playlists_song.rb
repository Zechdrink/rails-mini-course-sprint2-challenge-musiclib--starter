class PlaylistsSong < ApplicationRecord
    belongs_to :playlist
    belongs_to :song

    has_many :playlists_songs
    has_many :playlists, through: playlists_songs
end
