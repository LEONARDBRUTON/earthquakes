




class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting
     get_date
     menu
    end

    def greeting
       puts "Welcome to Earthquake News" 
        colorizer = Lolize::Colorizer.new
        #Colorizer.write(“Welcome to Earthquake News”)

    end

    def get_earthquakes
        place = gets.chomp
        puts ApiService.get_earthquakes(place)
    end

    # def get_date
    #     puts "Please enter the date you want to review?"
    #     date = gets.chomp
    #     ApiService.get_earthquakes(date)
    # end
    def menu
        CurrentEarthquakes::Earthquake.all.get_last
    #     colorizer = Lolize::Colorizer.new

    #     prompt = TTY::Prompt.new(active_color: :cyan)
    #         @menu = [
    #             {"All events" => -> do list_all_events end},
    #             {"Free events" => -> do free_events end},
    #             {"Exit" => -> do goodbye end}
    #         ]
     
    #         prompt.select("", @menu)
    end


    # def menu

    #    prompt = TTY::Prompt.new
    #    prompt.ask("EarthQuake date?, convert: :date")
    #     #binding.pry

    # end
    def date()
        date = gets.chomp
    end

end