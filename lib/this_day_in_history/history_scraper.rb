require 'open-uri'
require 'pry'
class History_Scraper
    def initialize
    end

	def self.site_scraper
		binding.pry
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
		
	end

end