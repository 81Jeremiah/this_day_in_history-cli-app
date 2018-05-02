class Cli

	def call
		welcome
	 puts "Welcome to the world of yesterday, today!"
	 puts "Press 1 to list all"
	 puts "Press 2 to see years"
     puts "Press 3 to categories"

	end


   def welcome
   	  puts "Welcome to the world of yesterday, today!"
	 puts "Press 1 to list all"
	 puts "Press 2 to see years"
     puts "Press 3 to categories"
     puts "Type 'exit' to be down for the day"
      input = gets.to_i

      while input =! "exit"
      	case input
      	when 1
      		history.all
      		puts" mains story...."
        when 2
        	history.list_by_year
            puts "in 1976...."
            puts " 1998....."
        when 3
        	history.list_by_category
     end

  end