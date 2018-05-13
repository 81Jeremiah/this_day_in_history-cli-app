require 'pry'
class ThisDayInHistory::CLI

	def call
		welcome
	end


   def welcome
     input = ""
     ThisDayInHistory::History_Scraper.new.show_events
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
    #   end

    end
end
