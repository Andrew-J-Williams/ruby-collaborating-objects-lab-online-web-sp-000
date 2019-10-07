class MP3Importer

  attr_accessor :path # First, we call our 'path' attribute.

  def initialize(path) # Second, we initialize our attribute by using an argument and calling it below.
    @path = path
  end

  def files # Third, we create a 'files' method for loading our mp3 files.
    @files = Dir.entries(@path) # We use 'Dir.enteries' to 
    @files.delete_if {|file| file == "." || file == ".."}
  end

  def import
    files.each {|file| Song.new_by_filename(file)}
  end

end
