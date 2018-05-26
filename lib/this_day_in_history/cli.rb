class ThisDayInHistory::CLI

  def call
    welcome  
	end
  
  def welcome
    ThisDayInHistory::Events.reset_all
    make_events
    puts "***********Today in History***********"
    list
  end

  def make_events
    ThisDayInHistory::History_Scraper.new.make_events
  end
    
  def list
    ThisDayInHistory::Events.list_by_title
    puts "***************************************"
    puts "Which event would you like to learn more about?(select a number)"
    input = gets.strip.to_i
    if input <= ThisDayInHistory::Events.all.length && input > 0
      find_by_number(input)
      more_options
    else
      puts "Please choose a number on the list"
      list
    end
  end

 def find_by_number(input)
  event = ThisDayInHistory::Events.all[input-1]
  puts "Title: #{event.title}"
  puts "Year: #{event.year}" 
  puts "Category: #{event.category}" 
    
  if event.category == "Lead Story"
    puts "#{event.story}"
  else 
    puts "#{event.full_story}"
    end
  end 



  def more_options
    input = ""
    puts "***************************************"
    puts "Finished reading for today? Type 'exit'"
    puts "To see the list again press 'enter'"
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
