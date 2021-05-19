class Job
  attr_reader :title, :link, :score, :location, :company, :date_posted
  
  def initialize(title, link, score, location, company, date_posted)
    @title = title
    @link = link
    @score = score
    @location = location
    @company = company
    @date_posted = date_posted
  end
end