require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = "")
    @name = name
  end

  def self.create
    song = Song.new
    song.save
    return song
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    rows = filename.split(" - ")
      artist_name = rows[0]
      name = rows[1].gsub(".mp3", "")  
      song = Song.new
      song.artist_name = artist_name
      song.name = name
      return song
  end

  def self.create_from_filename(filename)
    rows = filename.split(" - ")
    artist_name = rows[0]
    name = rows[1].gsub(".mp3", "")  
    song = Song.create
    song.artist_name = artist_name
    song.name = name
    return song
  end

  def self.new_by_name(name)
    return Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    return song
  end

  def self.find_by_name(name)
      Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name) 
        return self.find_by_name(name) 
      else 
        return self.create_by_name(name)
      end
  end

  def self.alphabetical
      Song.all.sort {|a, b| a.name <=> b.name}
  end


  def self.destroy_all
    self.all.clear
  end

end
