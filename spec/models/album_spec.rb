require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it "is valid" do
      # instantiate a valid album and ensure it is valid
      artist = Artist.create!(id: 1, name: "franco")
      puts artist
      album = Album.create!(name: "here", artist_id: artist.id)
      
      puts " I am here #{album.inspect}"
      result = album.valid?
      errors = album.errors.full_messages
      puts result
      

      expect(result).to be true
      expect(errors).to be_empty
    end

    it "is invalid without a name" do
      artist2 = Artist.create!(id: 2, name: "franco")
      puts artist2
      secondAlbum = Album.create(id: 2, artist_id: artist2.id)
      puts secondAlbum

      
      result2 = secondAlbum.valid?
      errors2 = secondAlbum.errors.full_messages
      puts "I AM RESULT2 #{result2}"
      
      expect(result2).to be false
      expect(errors2.count).to be > 0
      # instantiate an album without a name and ensure it is invalid
    end
  end

  describe "attributes" do
    it "has expected attributes" do
      # ensure exactly the expected attributes are present on an album
      artist = Artist.create(id: 1, name: "franco")
      album = Album.new(name: "yolo").attribute_names

      result = album

      expect(result).to contain_exactly(
        "id","name", "available", "artist_id", "created_at", "updated_at"
      )
    end
  end

  # context "scopes" do
  #   describe "available" do
  #     it "returns a list of available albums sorted by name" do
  #       # set up a some available albums and unavailable albums and make expecations that the
  #       # available albums scope only returns available albums sorted by name
  #     end
  #   end
  # end

  # describe "#length_seconds" do
  #   it "calculates the total length in seconds of an album" do
  #     # setup a valid album and songs and make expecations about the return value of length seconds
  #   end
  # end
end
