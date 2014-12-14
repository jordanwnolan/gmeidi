require 'bundler'
Bundler.setup :default
require 'sinatra'
require 'sprockets'

class GMEIDIApplication < Sinatra::Base
  get '/' do
    haml :homepage
  end
end