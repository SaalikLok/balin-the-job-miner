require_relative 'remote_ok_scraper'

class Scraper  
  def initialize
    @jobs = []
  end
  
  def get_jobs
    scraper_remote_ok = RemoteOKScraper.new
    @jobs += scraper_remote_ok.remote_ok_jobs

    @jobs.sort! { |a, b|  b.score <=> a.score }
    return @jobs
  end

  def sort_jobs
    
  end
end