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
     
     	self.get_events.collect do |e|
		  event = Event.new
		  event.year = e.css(".year").first.text
		  event.title = e.css(".title").first.text
		  event.category = e.css(".category").first.text
		  event.story = e.css("p").first.text
		  binding.pry
		end	
	end
    
    def show_events
    	self.make_events
       Event.all.collect do |event|
       	if event.title
       		puts "Title: #{event.title}"
       		puts "Year: #{event.year}"
       		puts "Category: #{event.category}"
       	end
       end	
    end
end

history = History_Scraper.new
history.show_events
#puts "is this working?"