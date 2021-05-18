require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'

set :haml, :format => :html5

get '/' do
  haml :index
end