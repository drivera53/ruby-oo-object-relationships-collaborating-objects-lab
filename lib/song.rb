require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @artist = artist 
        @@all << self
    end

    def self.all
        @@all
    end

    
    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        song_artist = filename.split(" - ")[0]
        song = self.new(song_name)
        song.artist = Artist.new(song_artist)
        song
    end 

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end

end

#binding.pry