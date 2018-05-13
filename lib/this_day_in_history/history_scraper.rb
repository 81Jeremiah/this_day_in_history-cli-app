require 'open-uri'
require 'pry'
require 'nokogiri'



class ThisDayInHistory::History_Scraper
    # def initialize
    # end

	def site_scraper
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
	end
		
     def get_events
     	self.site_scraper.css(".day-article")
     end

     def make_events
        
     	self.get_events.each do |e|
     		#binding.pry
		  event = ThisDayInHistory::Event.new
		 event.year = e.css(".year").text #collect{|e| e.text.strip}
		   event.title = e.css(".title").text #collect{|e| e.text.strip}
		  event.category = e.css(".category").text #collect{|e| e.text.strip}
		   event.story = e.css("p").text #collect{|e| e.text.strip}
		   #binding.pry
		end	
		
	end	
	# 	self.get_events.each do |e|
			
	# 		e.each do| |
	# 		ThisDayInHistory::Event(title, year, category, story)

	# 		year = e.css(".year").text
	# end
    
    def scrape_titles
        
        self.get_events.each do |e|
        	@titles = e.css(".title").collect{|e| e.text.strip}
        end
        @titles
       # binding.pry
    end

    def scrape_year
        
        self.get_events.each do |e|
        	@years = e.css(".year").collect{|e| e.text.strip}
        end
        @years
       # binding.pry
    end

    # def create_events
    # 	ThisDayInHistory::Event.

    def show_events
    	self.make_events
       ThisDayInHistory::Event.all.each do |event|
       	if event.title
       		puts "Title: #{event.title}"
       		puts "Year: #{event.year}"
       		puts "Category: #{event.category}"
       		puts "Stories: #{event.story}"
       	end
       end	
    end
end

#ThisDayInHistory::History_Scraper.new.make_events

