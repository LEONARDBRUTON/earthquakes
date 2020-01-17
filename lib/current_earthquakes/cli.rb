




class CurrentEarthquakes::Cli
 
    def call
     ApiService.get_earthquakes
     greeting
     menu
     #menu2
    end

    def greeting
       puts "Welcome to Earthquake News!" 
        #puts "Hit enter to continue to the latest earthquakes."
         
    end

    def event
        earthquake_hash = []
        Earthquakes.all.each{ |earthquake| earthquake_hash <<{earthquake.place => ->   do display(earthquake) end }}
        prompt = TTY::Prompt.new(active_color: :cyan)
             prompt.select("Choose one?", earthquake_hash)
             menu
    end

    def display(earthquake)
        #binding.pry
       puts earthquake.place

       puts earthquake.mag
       
       puts earthquake.time
    end
    


    def menu
        prompt = TTY::Prompt.new(active_color: :cyan)
             @menu = [
                 {"Today's Earthquakes" => ->  do 
                 event 
                 end},
                 {"Exit" => -> do goodbye 
                end}
             ]
             prompt.select("", @menu)
             
               
    end
            
            #binding.pry
            #choices = %w(Scorpion Kano Jax)
#prompt.select("Choose your destiny?", choices, help: "(Bash keyboard)", symbols: {marker: '>'})
# =>
# Choose your destiny? (Bash keyboard)
# > Scorpion
#   Kano
#   Jax


         

    # def menu2
    #     prompt = TTY::Prompt.new(active_color: :cyan)
    #         @menu2 = [
    #               {"Chose one?" => ->  do 
    #               display 
                
    #              end},
    #               {"Exit?" => -> do goodbye 
    #              end}
    #           ]
     
    #          prompt.select("", @menu2)
    #          #binding.pry
    # end

    def goodbye
        puts "Goodbye"
        exit
    end
end