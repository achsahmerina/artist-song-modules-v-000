class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
