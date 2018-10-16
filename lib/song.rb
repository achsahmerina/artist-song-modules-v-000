class Song
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable
  attr_accessor :name
  attr_reader :artist

  @@songs = []

  def artist=(artist)
    @artist - artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def self.all
    @@songs
  end

end
