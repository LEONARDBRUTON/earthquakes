require 'time'

class Earthquakes
    attr_accessor :place, :time, :mag, :date
    @@all = []

    def initialize(args)
        @place = args['place']
        @time = Earthquakes.source_time(args['time'])
        @mag = args['mag']
        @@all << self
    end

    def self.all
        @@all
    end

    def self.get_date
        self.all.date
    end

    def self.source_time(date)
        #binding.pry
        Time.at(date/1000)
    end

end