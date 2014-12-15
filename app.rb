require 'bundler'
Bundler.setup :default
require "sinatra/base"
require "sinatra/json"
require 'sprockets'
require './app/routes'

class GMEIDIApplication < Sinatra::Base
  helpers Sinatra::JSON
  register Sinatra::GMEIDI::Routing
end