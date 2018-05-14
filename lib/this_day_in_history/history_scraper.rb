require 'open-uri'
require 'pry'
require 'nokogiri'



class ThisDayInHistory::History_Scraper

	def site_scraper
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
	end
		
     def get_events
     	self.site_scraper.css(".day-article")
     end

     def make_events    
     	self.get_events.each do |e|
		  event = ThisDayInHistory::Event.new
		  event.year = e.css(".year").text 
		  event.title = e.css(".title").text 
		  event.category = e.css(".category").text 
		  event.story = e.css("p").text 
		end	
		
	end	
end


