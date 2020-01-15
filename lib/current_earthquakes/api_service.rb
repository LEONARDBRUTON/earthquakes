require 'pry'
require "rest-client"
class ApiService

    def self.get_earthquakes
    
        url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson'
        response = RestClient.get(url)
        JSON.parse(response)["features"].each { |earthquake| Earthquakes.new(earthquake['properties'])}
        binding.pry
    
    end
end
#ApiService.get_earthquakes
#e['features'][0]['properties']['mag']

