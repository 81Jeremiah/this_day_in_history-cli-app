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
     	self.site_scraper.css(".day-articles")
     end

     def make_events
        events = []
     	self.get_events.each do |e|
          year = e.css(".year").text
          events << {year: year}
     		#binding.pry
		  # event = ThisDayInHistory::Event.new
		  # event.year = e.css(".year").text #collect{|e| e.text.strip}
		  # event.title = e.css(".title").text #collect{|e| e.text.strip}
		  # event.category = e.css(".category").text #collect{|e| e.text.strip}
		  # event.story = e.css("p").text #collect{|e| e.text.strip}
		  # binding.pry
		end	
		events
		
	end
    
    def scrape_titles
        
        self.get_events.each do |e|
        	@titles = e.css(".title").collect{|e| e.text.strip}
        end
        @titles
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

#History_Scraper.new.show_events

#puts "is this working?"