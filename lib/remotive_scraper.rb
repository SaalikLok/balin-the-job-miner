require_relative 'scraper_helper'

class RemotiveScraper
  def initialize
    @url = "https://remotive.io/?live_jobs[sortBy]=live_jobs_sort_by_date&live_jobs[menu][category]=Software%20Development"
    @jobs = []
  end

  def remotive_jobs
    raw_jobs = scrape_from_url

    raw_jobs.each do |raw_job|
      title = raw_job.css(".job-tile-title").children.css("span").children.to_s
      remotive_path = raw_job.css(".job-tile-title").first.attributes["href"].value
      link = "https://remotive.io#{remotive_path}"
      company = raw_job.css("p.tw-text-xs").children.css("span")[0].children.to_s
      location = "Remote"
      hours_since_posted = "several"

      score = remotive_job_score(title)

      if score > 70
        job = Job.new(title, link, score, location, company, hours_since_posted)
        @jobs << job
      end
    end

    return @jobs
  end

  def remotive_job_score(title)
    score = 25
    text_array = title.downcase.split(' ')
    score += calculate_blocker_or_booster(text_array)
  end

  def scrape_from_url
    full_html = Nokogiri::HTML.parse(URI.open(@url).read)
    all_jobs = full_html.css('.job-tile')

    return all_jobs
  end
end