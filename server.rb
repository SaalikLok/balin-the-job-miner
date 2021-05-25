require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require_relative './lib/scraper'
require_relative './lib/lotr_quote'

set :haml, :format => :html5

get '/' do
  scraper = Scraper.new
  @jobs = scraper.get_jobs

  quote = Lotr_quote.new
  @quote_text = quote.quote_text
  @quote_author_name_race = quote.author_name_race

  haml :index
end