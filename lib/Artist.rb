require "pry"

class Artist
attr_accessor :name, :songs, :genres

extend Concerns::Findable
include Concerns::Findable

@@all= []

def initialize(name)
  @name = name
  @songs = []
end

def save
  @@all << self
end

def songs
  @songs
end

def add_song(song)
  if !@songs.include?(song)
    @songs << song
<<<<<<< HEAD
    # binding.pry
  if song.artist != self
    song.artist = self
  end
=======
      if song.artist != self
        song.artist = self
      end
>>>>>>> 223f273ed01702de9b52eea9c6f68bc4add6c06c
  end
end

def genres
 @genres = @songs.collect {|song| song.genre}
  @genres.uniq
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

<<<<<<< HEAD
# def self.create(name)
#   artist = Artist.new(name)
#   artist.save
#   artist
# end
=======
def self.create(name)
  artist = Artist.new(name)
  artist.save
  artist
end
>>>>>>> 223f273ed01702de9b52eea9c6f68bc4add6c06c


end
