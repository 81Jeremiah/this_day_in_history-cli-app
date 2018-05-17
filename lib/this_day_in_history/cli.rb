class ThisDayInHistory::CLI

	def call
		welcome  
	end

  def welcome
    ThisDayInHistory::Event.reset_all
    make_events
    puts "***********Today in History***********"
    list
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