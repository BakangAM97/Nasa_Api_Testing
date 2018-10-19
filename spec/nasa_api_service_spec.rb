require_relative "../lib/nasa_api.rb"

describe "Nasa Api" do

  before(:all) do
    @nasa_index = Nasa.new.get_nasa_service
  end
  context "core asteroids information" do
    it "should return a hash for atsteroids" do
      expect(@nasa_index.asteroids).to be_a Hash
    end
    it "should return a hash for links" do
      expect(@nasa_index.asteroids["links"]).to be_a Hash
    end
    it "shoud return an integer for element count" do
      expect(@nasa_index.asteroids["element_count"]).to be_a Integer
    end
    it "shoud return an hash for near earth objects" do
      expect(@nasa_index.asteroids["near_earth_objects"]).to be_a Hash
    end

  end

  context "core links information" do
    it "should return a String for next" do
      expect(@nasa_index.asteroids["links"]["next"]).to be_a String
    end
    it "should return a String for prev" do
      expect(@nasa_index.asteroids["links"]["prev"]).to be_a String
    end
    it "should return a String for self" do
      expect(@nasa_index.asteroids["links"]["self"]).to be_a String
    end
  end

  context "core near earth objects information" do
    it "near earth objects should have two attributes" do
      expect(@nasa_index.asteroids["near_earth_objects"].length).to eq 2
    end
    it "should return an array for 2015-09-08" do
      expect(@nasa_index)
    end
  end


end
