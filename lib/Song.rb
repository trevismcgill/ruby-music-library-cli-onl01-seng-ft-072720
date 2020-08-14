require "pry"

class Song
attr_accessor :name, :artist, :genre

extend Concerns::Findable
include Concerns::Findable

@@all= []

def initialize(name, artist = nil, genre = nil)
  @name = name
  if artist != nil
    self.artist=(artist)
  end

  if genre != nil
    self.genre=(genre)
  end
end

def save
  @@all << self
end

def artist=(artist)
  # binding.pry
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  if !genre.songs.include?(self)
  genre.songs << self
  end
end

def self.find_by_name(name)
  self.all.detect {|song| song.name == name}
end

# def self.create(name)
#   song = Song.new(name)
#   song.save
#   song
# end
#
# def self.find_or_create_by_name(name)
#   find_by_name(name) == nil ? create(name) : find_by_name(name)
# end

def self.new_from_filename(filename)
  file_array = filename.split(" - ")
  song = Song.new(file_array[1], Artist.find_or_create_by_name(file_array[0]), Genre.find_or_create_by_name(file_array[2].chop.chop.chop.chop))
  # binding.pry
  song
end

def self.create_from_filename(filename)
  new_from_filename(filename).save
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

end
