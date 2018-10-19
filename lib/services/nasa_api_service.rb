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


end
