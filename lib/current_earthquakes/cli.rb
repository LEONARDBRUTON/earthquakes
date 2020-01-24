

class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting
     menu
    end

    def greeting
       puts "******Welcome to Earthquake News!******".colorize(:blue)    
    end

    def menu
        puts  "See Earthquakes for the last 24hr?".colorize(:light_blue)
        puts "Enter Y for Yes or N for No.".colorize(:red)
        input = gets.strip.upcase
        if input == "Y"
            Earthquakes.all.each.with_index(1) do |earthquake, index|
                puts "#{index}. #{earthquake.place}".colorize(:red)
            end
              list_choice  
        elsif input == "N"
                 goodbye
        else
            puts "invalid input, try again!".colorize(:red)
            menu
        end
        
    end

    def list_choice
        puts "Choose number of place to see details, or N to exit?".colorize(:blue)
        input = gets.strip
        if input.upcase == "N"
            goodbye
    
        elsif  input.to_i <= Earthquakes.all.count && input.to_i >= 1
            earthquake = Earthquakes.all[input.to_i-1]
            display(earthquake).colorize(:red)   
       else
            puts "invalid input, try again!".colorize(:red)
            menu
        end
    end
    
    def display(earthquake)
    
       puts earthquake.place

       puts earthquake.mag

       puts earthquake.time
       
        menu
    end

    def goodbye
        puts "May the force be with you!...Goodbye!".colorize(:blue)
        exit
    end
end