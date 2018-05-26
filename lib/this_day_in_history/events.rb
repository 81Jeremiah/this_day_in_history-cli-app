class ThisDayInHistory::Events
  attr_accessor :title,:year, :category, :story, :link, :full_story

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
end



