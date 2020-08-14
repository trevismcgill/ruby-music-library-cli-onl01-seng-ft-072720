require "pry"
class Genre
attr_accessor :name, :songs, :artists

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

def artists
  @artists = @songs.collect {|song| song.artist}
  @artists.uniq
end
def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  genre = Genre.new(name)
  genre.save
  genre
end

end
