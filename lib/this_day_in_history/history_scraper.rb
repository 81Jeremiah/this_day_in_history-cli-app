class ThisDayInHistory::History_Scraper

	def site_scraper
		doc = Nokogiri::HTML(open('https://www.history.com/this-day-in-history'))
	end
		
     def get_events
     	self.site_scraper.css(".day-article")
     end

     def make_events    
     	self.get_events.each do |e|
     	  if ThisDayInHistory::Events.all.none?{|event| event.title == e.css(".title").text}
		    event = ThisDayInHistory::Events.new
		    event.year = e.css(".year").text 
		    event.title = e.css(".title").text 
		    event.category = e.css(".category").text 
		    event.story = e.css("p").text 
		      if event.category != "Lead Story"
                event.link = e.css(".title a").attribute("href").value
                new_page = Nokogiri::HTML(open("https://www.history.com#{event.link}"))
                event.full_story = new_page.css(".article").first.text.strip
		      end   
		   end	
		end
     end
end


