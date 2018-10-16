class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods
  attr_accessor :name, :artist
  attr_reader :songs

  @@all = []

  def initialize
    super
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
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |songs| add_song(songs) }
  end

end
