require 'pry'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
      song.artist = self
    end

    def add_song_by_name(song_name)
        song_name = Song.new(song_name)
        song_name.artist = self
    end

    def self.song_count
        song_counts = []
        @@all.map do |individual_artist|
            song_counts << individual_artist.songs.count 
        end
        song_counts.sum
    end


end