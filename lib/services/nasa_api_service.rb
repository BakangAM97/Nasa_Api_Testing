require 'json'
require 'httparty'

class NasaService

  include HTTParty
  base_uri "https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08"

  attr_accessor :asteroids

  def initialize

    @api_key = 'VAwpyMByziUctBaTFvQqsO4n8Bgl2AdMM7Uek2mw'

    @asteroids = JSON.parse(self.class.get("&api_key=#{@api_key}").body)

  end

  def check_hash_elements
     @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
       unless element.is_a? Hash
         return false
       end
    end
    return true
  end

  def check_links_key_class key, klass
    @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
      unless element[key].is_a? klass
        return false
      end
    end
    return true
  end

  def check_links_key_bool key
    @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
      unless !!element[key] == element[key]
        return false
      end
    end
    return true
  end

  def check_self_string
    @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
      unless element["links"]["self"].is_a? String
        return false
      end
    end
    return true
  end
 # =============  ESITMATED DIAMETER METHODS ===========
  def check_ed_key_class key, klass
    @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
      unless element["estimated_diameter"][key].is_a? klass
        return false
      end
    end
    return true
  end

  def check_ed_inner_key_class key1,key2,klass
    @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
      unless element["estimated_diameter"][key1][key2].is_a? klass
        return false
      end
    end
    return true
  end

  # =============  CLOSE APPROACH DATA METHODS ===========
   def check_ca_key_class key, klass
     @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
       unless element["close_approach_data"].first[key].is_a? klass
         return false
       end
     end
     return true
   end

   def check_ca_inner_key_class key1,key2,klass
     @asteroids["near_earth_objects"]["2015-09-08"].each do |element|
       unless element["close_approach_data"].first[key1][key2].is_a? klass
         return false
       end
     end
     return true
   end



end
