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
      expect(@nasa_index.asteroids["near_earth_objects"]["2015-09-08"]).to be_a Array
    end
  end

  context "core 2015-09-08 information" do
    it "should return a hash for the elements" do
      expect(@nasa_index.check_hash_elements).to eq true
    end
    it "should return a Hash for links" do
      expect(@nasa_index.check_links_key_class "links", Hash).to eq true
    end
    it "should return a String in self for links" do
      expect(@nasa_index.check_self_string).to eq true
    end
    it "should return a String for id" do
      expect(@nasa_index.check_links_key_class "id", String).to eq true
    end
    it "should return a String for neo_reference_id" do
      expect(@nasa_index.check_links_key_class "neo_reference_id", String).to eq true
    end
    it "should return a String for name" do
      expect(@nasa_index.check_links_key_class "name", String).to eq true
    end
    it "should return a String for nasa_jpl_url" do
      expect(@nasa_index.check_links_key_class "nasa_jpl_url", String).to eq true
    end
    it "should return a Numeric for absolute_magnitude_h" do
      expect(@nasa_index.check_links_key_class "absolute_magnitude_h", Numeric).to eq true
    end
    it "should return a Hash for estimated_diameter" do
      expect(@nasa_index.check_links_key_class "estimated_diameter", Hash).to eq true
    end
    it "should return a Array for close_approach_data" do
      expect(@nasa_index.check_links_key_class "close_approach_data", Array).to eq true
    end
    it "should return a boolean for is_potentially_hazardous_asteroid" do
      expect(@nasa_index.check_links_key_bool "is_potentially_hazardous_asteroid").to eq true
    end
    it "should return a boolean for is_sentry_object" do
      expect(@nasa_index.check_links_key_bool "is_sentry_object").to eq true
    end
  end

  context "core estimated_diameter diameter information" do
    it "shuold retrun a Hash for kilometers" do
      expect(@nasa_index.check_ed_key_class "kilometers", Hash).to be true
    end
    it "should return a Numeric for estimated_diameter_min" do
      expect(@nasa_index.check_ed_inner_key_class "kilometers","estimated_diameter_min", Numeric).to eq true
    end
    it "should return a Numeric for estimated_diameter_max" do
      expect(@nasa_index.check_ed_inner_key_class "kilometers","estimated_diameter_max", Numeric).to eq true
    end

    it "shuold retrun a Hash for meters" do
      expect(@nasa_index.check_ed_key_class "meters", Hash).to be true
    end
    it "should return a Numeric for estimated_diameter_min" do
      expect(@nasa_index.check_ed_inner_key_class "meters","estimated_diameter_min", Numeric).to eq true
    end
    it "should return a Numeric for estimated_diameter_max" do
      expect(@nasa_index.check_ed_inner_key_class "meters","estimated_diameter_max", Numeric).to eq true
    end

    it "shuold retrun a Hash for miles" do
      expect(@nasa_index.check_ed_key_class "miles", Hash).to be true
    end
    it "should return a Numeric for estimated_diameter_min" do
      expect(@nasa_index.check_ed_inner_key_class "miles","estimated_diameter_min", Numeric).to eq true
    end
    it "should return a Numeric for estimated_diameter_max" do
      expect(@nasa_index.check_ed_inner_key_class "miles","estimated_diameter_max", Numeric).to eq true
    end

    it "shuold retrun a Hash for feet" do
      expect(@nasa_index.check_ed_key_class "feet", Hash).to be true
    end
    it "should return a Numeric for estimated_diameter_min" do
      expect(@nasa_index.check_ed_inner_key_class "feet","estimated_diameter_min", Numeric).to eq true
    end
    it "should return a Numeric for estimated_diameter_max" do
      expect(@nasa_index.check_ed_inner_key_class "feet","estimated_diameter_max", Numeric).to eq true
    end
  end

  context "core close_approach_data information" do
    it "should return a String for the close_approach_date" do
      expect(@nasa_index.check_ca_key_class "close_approach_date", String).to eq true
    end
    it "should return a String for the epoch_date_close_approach" do
      expect(@nasa_index.check_ca_key_class "epoch_date_close_approach", Numeric).to eq true
    end
    it "should return a String for the relative_velocity" do
      expect(@nasa_index.check_ca_key_class "relative_velocity", Hash).to eq true
    end
    it "should return a String for kilometers_per_second" do
      expect(@nasa_index.check_ca_inner_key_class "relative_velocity","kilometers_per_second",String).to eq true
    end
    it "should return a String for kilometers_per_hour" do
      expect(@nasa_index.check_ca_inner_key_class "relative_velocity","kilometers_per_hour",String).to eq true
    end
    it "should return a String for miles_per_hour" do
      expect(@nasa_index.check_ca_inner_key_class "relative_velocity","miles_per_hour",String).to eq true
    end

    it "should return a String for the miss_distance" do
      expect(@nasa_index.check_ca_key_class "miss_distance", Hash).to eq true
    end
    it "should return a String for astronomical" do
      expect(@nasa_index.check_ca_inner_key_class "miss_distance","astronomical",String).to eq true
    end
    it "should return a String for lunar" do
      expect(@nasa_index.check_ca_inner_key_class "miss_distance","lunar",String).to eq true
    end
    it "should return a String for kilometers" do
      expect(@nasa_index.check_ca_inner_key_class "miss_distance","kilometers",String).to eq true
    end
    it "should return a String for miles" do
      expect(@nasa_index.check_ca_inner_key_class "miss_distance","miles",String).to eq true
    end

    it "should return a String for the orbiting_body" do
      expect(@nasa_index.check_ca_key_class "orbiting_body", String).to eq true
    end
  end



end
