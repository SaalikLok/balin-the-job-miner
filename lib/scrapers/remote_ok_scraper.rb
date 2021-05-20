require_relative 'scraper_helper'

class RemoteOKScraper
  def initialize
    @url = "https://remoteok.io/remote-dev-jobs"
    @jobs = []
  end

  def remote_ok_jobs
    raw_jobs = scrape_from_url
    
    raw_jobs.each do |raw_job|
      title = raw_job.css('.company_and_position h2').first.children.to_s
      tags = raw_job.css('.tags h3')
      date_posted = Time.parse(raw_job.css('.time time').first.attributes["datetime"].value)
      hours_since_posted = ((Time.now - date_posted) / 3600).round()
      
      score = remote_ok_job_score(title, tags, date_posted)

      if score > 70
        company = raw_job.css('.companyLink h3').first.children.to_s.strip
        
        if raw_job.css('.source a').length > 0
          remote_ok_link = raw_job.css('.source a').first.attributes["href"].value
          link = "https://remoteok.io#{remote_ok_link}"
        else
          link = "https://remoteok.io"
        end

        if raw_job.css('.location').length > 0
          location = raw_job.css('.location').first.children.first.to_s
        else  
          location = ""
        end

        job = Job.new(title, link, score, location, company, hours_since_posted)
        @jobs << job
      end
    end

    return @jobs
  end

  def remote_ok_job_score(title, tags, date_posted)
    score = 50
    text_array = title.downcase.split(' ')
    tags.each do |tag|
      tag_text = tag.children.to_s
      text_array << tag_text
    end
    
    score += calculate_blocker_or_booster(text_array)
    score += calculate_time_score(date_posted)
    
    return score
  end

  def scrape_from_url
    full_html = Nokogiri::HTML.parse(URI.open(@url).read)
    all_jobs = full_html.css('.job')

    return all_jobs
  end
end