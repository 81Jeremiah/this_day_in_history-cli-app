require 'pry'
class ThisDayInHistory::CLI

	def call
		welcome
    
	end


   def welcome
    ThisDayInHistory::Event.reset_all
    make_events
     #input = ""
     #while input != "exit"
     
     puts "***********Today in History***********"
     list
     # puts "Type 'List' to see a full list"
     # puts "Type 'year' to see a list by year"
     # puts "Type 'categories' to see a list by category"
     
    #  input = gets.strip
    #  case input
    #   when "List"
    #     list
    #   when "year"
    #     ThisDayInHistory::Event.list_by_year
    #   when "categories"
    #     ThisDayInHistory::Event.list_by_category

      
    # end

     #ThisDayInHistory::History_Scraper.new
     #ThisDayInHistory::Event.new
     #ThisDayInHistory::History_Scraper.all
     #ThisDayInHistory::History_Scraper.new.scrape_titles.each.with_index(1) {|i,e| puts "#{e}. #{i}"}
    # puts "Choose which event to learn more about"
    
    #  while input != "exit"
    #  puts "Welcome to the world of yesterday, today!"
	   # puts "Type 1 to see the main story"
	   # puts "Type 2 to see a list by year"
    #  puts "Type 3 to list categories"
    #  puts "Type 'exit' to be done for the day"
    #  input = gets.strip

      
    #   	case input
    #   	when "1"
    #   		#history.all
    #   		puts" mains story...."
    #     when "2"
    #     	#history.list_by_year
    #       puts "in 1976...."
    #       puts " 1998....."
    #     when "3"
    #       puts "Cold War"
    #       puts "American"

    #       #history.list_by_category
    
      #end
    end

   def make_events
    ThisDayInHistory::History_Scraper.new.make_events
   end
    
    def list
     ThisDayInHistory::Event.list_by_title
       puts "Which event would you like to learn more about?(select a number)"
        input = gets.strip.to_i
        if input <= ThisDayInHistory::Event.all.length && input > 0
        ThisDayInHistory::Event.find_by_number(input)
        more_options
        else
        puts "Please choose a number on the list"
        list
      end
        # puts "Finished reading for today? Type 'exit'"
        # Puts
        # unless input == "exit"
        #   list
    end

   def more_options
      input = ""
    puts "Finished reading for today? Type 'exit'"
    puts "To see the list again press any key"
     input = gets.strip.downcase
        if input == "exit"
        exit
        else
          list
      end
   end

   def exit
    puts "Goodbye. Come back tomorrow for more great events in history!"
  end
end