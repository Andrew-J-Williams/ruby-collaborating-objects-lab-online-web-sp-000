class MP3Importer

  attr_accessor :path # First, we call our 'path' attribute.

  def initialize(path) # Second, we initialize our attribute by using an argument and calling it below.
    @path = path
  end

  def files # Third, we create a 'files' method for loading our mp3 files.
    @files = Dir.entries(@path) # We use 'Dir.enteries' to find our filenames assigned to our '@path'.
    @files.delete_if {|file| file == "." || file == ".."} # In order to remove files that don't fit our criteria, we use 'delete_if'.
  end

  def import
    self.each {|file| Song.new_by_filename(file)}
  end

end
