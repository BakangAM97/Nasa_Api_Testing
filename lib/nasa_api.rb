require_relative "services/nasa_api_service.rb"

class Nasa

  def get_nasa_service
    NasaService.new
  end

end
