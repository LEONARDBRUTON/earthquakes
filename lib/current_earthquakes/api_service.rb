

class CurrentEarthquakes::ApiService


    def self.get_earthquakes(significant_day)
        binding.pry
        url = https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_week.geojson
        response = RestClient.get(url)
        CurrentEarthquakes::Earthquakes.new(JSON.parse(response0))
    end
end
