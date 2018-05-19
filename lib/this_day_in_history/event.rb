class ThisDayInHistory::Event
  attr_accessor :title,:year, :category, :story, :link ,:full_story

  @@all = []

  def initialize
	@@all << self    
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

  def self.find_by_number(input)
 	puts "Title: #{@@all[input-1].title}"
 	puts "Year: #{@@all[input-1].year}" 
 	puts "Category: #{@@all[input-1].category}" 
 	  if @@all[input-1].category == "Lead Story"
 	    puts "#{@@all[input - 1].story}"
      else puts "#{@@all[input - 1].full_story}"
    end
  end 
end



