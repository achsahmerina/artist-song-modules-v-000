class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Paramable
  include Memorable::InstanceMethods
  
  @@artists = []

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@artists
  end

  def self.find_by_name(name)
    @@artists.detect {|a| a.name == name}
  end
end
