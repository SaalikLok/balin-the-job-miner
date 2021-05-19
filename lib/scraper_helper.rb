require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'blockers_n_boosters'
require_relative 'main_job_board'
require_relative 'job'

def calculate_time_score(date_posted)
  score = 0
  hours_since_posted = (Time.now - date_posted) / 3600

  if hours_since_posted <= 6
    score += 50
  elsif hours_since_posted <= 12
    score += 45
  elsif hours_since_posted <= 24
    score += 35
  elsif hours_since_posted <= 36
    score += 25
  elsif hours_since_posted <= 48
    score += 20
  end

  return score
end

def calculate_blocker_or_booster(text_array)
  score = 0
  has_blockers = text_array.any? { |text| BLOCKERS.include?(text) }
  has_boosters = text_array.any? { |text| BOOSTERS.include?(text) }

  if has_blockers
    score -= 100
  elsif has_boosters
    score += 50
  end

  return score
end