require 'open-uri'
require 'pry'
require 'nokogiri'

class History_Scraper
    # def initialize
    # end

	def site_scraper
		
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
	end
		
     def get_events
     	self.get_events.css(".day-articles")
     end
		today = []
		doc.css("div.day-articles").collect do |event|
			year = event.css(".year").text
			event_title = event.css(."title")
			category = event.css(".category")
			story = event.css(".article").text
        today << {year: year}
		end
		binding.pry
		today
	end

end

History_Scraper.site_scraper
#puts "is this working?"