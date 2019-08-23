class SongSorter
    #initialized with two arguments: 1) *the list of songs* and 2) *the sort value*. 
  def initialize(songs)
    @songs = songs
    @value = "reverse"
  end

  def sort
    if @value == "random"
      @sorted_songs = @songs.to_a.shuffle
    elsif @value == "reverse"
      @sorted_songs = @songs.to_a.reverse
    else
      @sorted_songs = @songs
    end
  end
end
