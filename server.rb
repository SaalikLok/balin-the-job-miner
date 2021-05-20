require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require_relative './lib/scraper'

set :haml, :format => :html5

get '/' do
  scraper = Scraper.new
  @jobs = scraper.get_jobs

  haml :index
end