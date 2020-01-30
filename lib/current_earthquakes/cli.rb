

class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting   
     menu
    end

    def greeting
        puts "***************************************".colorize(:light_blue)
        puts "*     Welcome to Earthquake News!     *".colorize(:blue)
        puts "*                                     *".colorize(:light_blue)
        puts "***************************************".colorize(:light_blue)
    end

    def menu
         puts "******************************************".colorize(:blue)
         puts "**  See Earthquakes for the last 24hr?  **".colorize(:light_blue)
         puts "******************************************".colorize(:blue)
         puts "******************************************".colorize(:blue)
         puts "**  Enter Y for Yes, or N for Exit?     **".colorize(:light_blue)
         puts "******************************************".colorize(:blue)
         puts "                                          "

        input = gets.strip.upcase
        if input == "Y"
         Earthquakes.all.each.with_index(1) do |earthquake, index|
            puts "#{index}. #{earthquake.place}".colorize(:red)
         end
              list_choice  
        elsif input == "N"
                 goodbye
        else
            puts "**********************************".colorize(:red)
            puts "**   INVALID INPUT, try again!  **".colorize(:red)
            puts "**********************************".colorize(:red)
         menu
        end
        
     end

    def list_choice
        puts "***********************************************************************".colorize(:blue)
        puts "** Scroll up & choose number of place to see details?, or N to exit? **".colorize(:blue)
        puts "***********************************************************************".colorize(:blue)
        input = gets.strip
        if input.upcase == "N"
            goodbye
    
        elsif  input.to_i <= Earthquakes.all.count && input.to_i >= 1
            earthquake = Earthquakes.all[input.to_i-1]
            display(earthquake).colorize(:red)   
       else
            puts "**********************************".colorize(:red)
            puts "**   INVALID INPUT, Try Again!  **".colorize(:red)
            puts "**********************************".colorize(:red)
            menu
        end
    end

    def display(earthquake)

       puts "*************************************".colorize(:red)
       puts earthquake.place

       puts earthquake.mag

       puts earthquake.time
       puts "*************************************".colorize(:red)
        menu
    end

    def goodbye
        puts "*********************************************".colorize(:blue)
        puts "**  May the force be with you!...Goodbye!  **".colorize(:light_blue)
        puts "*********************************************".colorize(:blue)
        exit
    end
end