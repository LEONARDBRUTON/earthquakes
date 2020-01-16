




class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting
     menu
    end

    def greeting
       puts "Welcome to Earthquake News!" 
        puts "Hit enter to continue to the latest earthquakes."
    end

    def event
        Earthquakes.all.each.with_index { |earthquake| puts earthquake.place }
    end

    def menu
        prompt = TTY::Prompt.new(active_color: :cyan)
             @menu = [
                 {"All events" => ->  do 
                 event 
                
                end},
                 {"Exit" => -> do goodbye 
                end}
             ]
     
            prompt.select("", @menu)
            #binding.pry
    end

    def goodbye
        puts "Goodbye"
        exit
    end
end