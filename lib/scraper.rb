require_relative './scrapers/remote_ok_scraper'
require_relative './scrapers/remotive_scraper'

class Scraper  
  def initialize
    @jobs = []
  end
  
  def get_jobs
    scraper_remote_ok = RemoteOKScraper.new
    scraper_remotive = RemotiveScraper.new
    
    @jobs += scraper_remote_ok.remote_ok_jobs
    @jobs += scraper_remotive.remotive_jobs

    @jobs.sort! { |a, b|  b.score <=> a.score }
    return @jobs
  end
end