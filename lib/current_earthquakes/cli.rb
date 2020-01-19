

class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting
     menu
    end

    def greeting
       puts "Welcome to Earthquake News!".colorize(:blue)    
    end

    def menu
        prompt = TTY::Prompt.new(active_color: :cyan)
            @menu = [
                {"See Today's Earthquakes?" => ->  do 
                event end},
                  {"Exit" => -> do goodbye end}]
            prompt.select("", @menu)
    end

    def event
        earthquake_hash = []
        Earthquakes.all.each{ |earthquake| earthquake_hash <<{earthquake.place => ->   do display(earthquake) end }}
        prompt = TTY::Prompt.new(active_color: :cyan)
        prompt.select("Choose location for details?".colorize(:blue), earthquake_hash,per_page: 20)
        menu
    end

    def display(earthquake)
    
       puts earthquake.place

       puts earthquake.mag

       puts earthquake.time

    end

    def goodbye
        puts "May the force be with you!...Goodbye!".colorize(:blue)
        exit
    end
end