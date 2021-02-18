require 'pry'

class Artist
    attr_accessor :name
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        artist_instance = [] 
        if self.all == []
            new_artist = self.new(artist_name)
            artist_instance = new_artist
        else
            self.all.select do |artist|
                if artist.name == artist_name
                    artist_instance = artist
                else
                    new_artist = self.new(artist_name)
                    artist_instance = new_artist
                end
            end
        end
        return artist_instance
    end

    def print_songs
        self.songs.select do |song|
            puts song.name
        end
    end

end

#binding.pry