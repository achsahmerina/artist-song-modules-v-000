class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods
  attr_accessor :name

  @@all = []

  def initialize
    @songs = []
    @@all << self
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
end
