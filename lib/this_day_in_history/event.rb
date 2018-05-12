class Event
	attr_accessor :title,:year, :category, :story

	 @@all = []

	def initialize(title = nil, year =nil, category =nil, story = nil)
		@@all << self
    end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

end



