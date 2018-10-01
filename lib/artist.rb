
class Artist

extend Concerns::Findable
extend MusicModule::ClassMethods
include MusicModule::InstanceMethods

attr_accessor :name, :songs
@@all = []
### class functions
def self.all
@@all
end

def self.destroy_all
@@all.clear
end

def self.create (name_of_artist)
@name = name_of_artist
@@all << self
return self
end


### instance methods
def initialize (name)
  @name = name
  @songs = []
##  song.artist= artist_object
end

def songs
  @songs
end

def add_song (song_object)
    if song_object.artist == nil
      song_object.artist = self
    end
    if !@songs.include?(song_object)
      @songs<< song_object
    end

end

def save
  @@all << self
end


def genres
    @genres = []
    songs.each{ |item| @genres << item.genre }
     @genres.uniq
end




end
