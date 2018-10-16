class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods
  attr_accessor :name

  @@artist = []

  def initialize
    @songs = []
    @@artist << self
  end

  def self.all
    @@artist
  end

  def self.find_by_name(name)
    @@artist.detect {|a| a.name == name}
  end

  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def add_songs(song)
    song.each { |songs| add_song(songs) }
  end
end
