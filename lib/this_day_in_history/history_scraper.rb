require 'open-uri'
require 'pry'
require 'nokogiri'
#require_relative './event.rb'

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
     
     	self.get_events.each do |e|
     		#binding.pry
		  event = ThisDayInHistory::Event.new
		  event.year = e.css(".year").collect{|e| e.text.strip}
		  event.title = e.css(".title").collect{|e| e.text.strip}
		  event.category = e.css(".category").collect{|e| e.text.strip}
		  event.story = e.css("p").collect{|e| e.text.strip}
		  #binding.pry
		end	
	end
    
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