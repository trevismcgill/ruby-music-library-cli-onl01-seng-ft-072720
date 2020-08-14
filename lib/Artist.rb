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
    # binding.pry
  if song.artist != self
    song.artist = self
  end
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

# def self.create(name)
#   artist = Artist.new(name)
#   artist.save
#   artist
# end


end
