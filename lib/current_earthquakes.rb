require "./lib/current_earthquakes/version"
require 'pry'
require 'rest-client'
require 'lolize'
require 'tty-prompt'
require 'json'
require_relative './current_earthquakes/api_service'
require_relative "./current_earthquakes/earthquakes"
require_relative "./current_earthquakes/cli"

# module CurrentEarthquakes

#   url = https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_day.geojson
# end
