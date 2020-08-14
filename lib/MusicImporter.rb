require "pry"

class MusicImporter
  attr_accessor :path
@@all = []

def initialize(path)
@path = path
end

def files
  files = []
  Dir.new(self.path).each do |file|
    files.push(file) if file.include?(".mp3")
  end
  files
end

def import
  self.files.each do |filename|
    Song.create_from_filename(filename)
  end
end

end
