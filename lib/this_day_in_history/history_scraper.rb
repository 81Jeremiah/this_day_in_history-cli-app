require 'open-uri'
require 'pry'
class History_Scraper

	def self.site_scraper(https://www.history.com/this-day-in-history)
		doc = Nokogiri::HTML(https://www.history.com/this-day-in-history)
		binding.pry
	end

end