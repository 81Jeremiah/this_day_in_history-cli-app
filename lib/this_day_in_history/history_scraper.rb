require 'open-uri'
require 'pry'
require 'nokogiri'

class History_Scraper
    def initialize
    end

	def self.site_scraper
		
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
		
		today = []
		doc.css("div.day-article").each do |event|
			event_title = event.css("title").text

		end
		binding.pry
		event_title
	end

end

History_Scraper.site_scraper
#puts "is this working?"