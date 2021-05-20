class Job
  attr_reader :title, :link, :score, :location, :company, :hours_since_posted
  
  def initialize(title, link, score, location, company, hours_since_posted)
    @title = title
    @link = link
    @score = score
    @location = location
    @company = company
    @hours_since_posted = hours_since_posted
  end
end