require 'time'

class Earthquakes
    attr_accessor :place, :mag, :time
    @@all = []

    def initialize(args)
        @place = args['place']
        @mag = args['mag']
        @time = Earthquakes.source_time(args['time'])
        
        @@all << self
    end

    def self.all
        @@all
    end

    def self.source_time(date)
        Time.at(date/1000)
    end

end