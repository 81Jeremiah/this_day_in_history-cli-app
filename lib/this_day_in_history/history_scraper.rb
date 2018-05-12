require 'open-uri'
require 'pry'
require 'nokogiri'

class History_Scraper
    def initialize
    end

	def self.site_scraper
		
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
		
		today = []
		doc.css("div.day-articles").each do |event|
			year = event.css(".year").text
        today << {year: year}
		end
		binding.pry
		today
	end

end

History_Scraper.site_scraper
#puts "is this working?"