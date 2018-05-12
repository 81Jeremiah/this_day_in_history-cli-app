require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative './event.rb'

class History_Scraper
    # def initialize
    # end

	def site_scraper
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
	end
		
     def get_events
     	self.site_scraper.css(".day-articles")
     end

     def make_events
     
     	self.get_events.each do |e|
		  event = Event.new
		  event.year = e.css(".year").text
		  event.title = e.css(".title").text
		  event.category = e.css(".category").text
		  event.story = e.css(".article").text
		  binding.pry
		end	
	end


end

history = History_Scraper.new
history.make_events
#puts "is this working?"