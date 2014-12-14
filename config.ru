require './app'
require 'sprockets'

map '/public' do
  environment = Sprockets::Environment.new
  environment.append_path 'public/javascripts'
  environment.append_path 'public/stylesheets'
  run environment
end

map '/' do
  run GMEIDIApplication
end