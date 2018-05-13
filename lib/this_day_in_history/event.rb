class ThisDayInHistory::Event
	attr_accessor :title,:year, :category, :story

    
	 @@all = []

	def initialize(title = nil, year =nil, category =nil, story = nil)
		
		@@all << self
		#binding.pry
    end

  def self.all
    @@all

  end

  def self.reset_all
    @@all.clear
  end

  def self.list_by_title
  	@@all.each.with_index(1){|event, i| puts "#{i}. #{event.title} "}
  end


 def list_by_year
   @@all.each.with_index(1){|event, i| puts "#{i}. #{event.year} "}
 end

 def list_by_category
   @@all.each.with_index(1){|event, i| puts "#{i}. #{event.category} "}
 end

end



