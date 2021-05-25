require 'dotenv/load'
require 'faraday'
require 'json'


class Lotr_quote
  def initialize
    @quote = get_random_lotr_quote
    @author = get_quote_author
  end

  def get_random_lotr_quote
    api_key = ENV['LOTR_API']
    quote_url = "https://the-one-api.dev/v2/quote"
  
    response = Faraday.get(quote_url, {}, {'Authorization' => "Bearer #{api_key}"})
    all_quotes_parsed = JSON.parse(response.body)
    
    @quote = all_quotes_parsed["docs"].sample
  end
  
  def get_quote_author
    api_key = ENV['LOTR_API']
    author_id = @quote["character"]
    author_url = "https://the-one-api.dev/v2/character/#{author_id}"
    
    response = Faraday.get(author_url, {}, {'Authorization' => "Bearer #{api_key}"})
    characted_parsed = JSON.parse(response.body)
    @author = characted_parsed["docs"].first
  end

  def quote_text
    @quote["dialog"]
  end

  def author_name_race
    "~ #{@author["name"]}, the #{@author["race"]}"
  end
end
