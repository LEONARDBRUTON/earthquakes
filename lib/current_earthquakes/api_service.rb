

require 'pry'
require "rest-client"
class ApiService

    def self.get_earthquakes
    
        url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson'
        response = RestClient.get(url)
        JSON.parse(response)["features"].each { |earthquake| Earthquakes.new(earthquake['properties'])}
    end
end


