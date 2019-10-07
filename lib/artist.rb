class Artist

  attr_accessor :name # Create our attribute for the artist's name.

  @@all = [] # Create a global variable to store all our our initialized artists.

  def initialize(name) # First, we initialize our Artist class with the name attribute.
    @name = name
    @@all << self # We take our class instance and push it into our class variable.
  end

  def self.all # A class method that will return the contents of our class variable '@@all'
    @@all
  end

  def songs # Second, we create our 'songs' method for returning all songs associated with a specific artist.
    Song.all.select {|song| song.artist == self} # We access our 'Song' class and its class variable and use 'select' on it.
  end # We then set the paramenters to return an array of all the songs whose artist is equal to the instance of the class.

  def add_song(song) # Third, we create 'add_song' to associate a song name with a particular artist.
    song.artist = self # When we call 'song.artist', we set the result equal to 'self', or the artist on which we are calling the method.
  end

  def self.find_or_create_by_name(artist_name)
    self.all.find {|data| data.name == artist_name} || self.new(artist_name)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end
