require 'bundler'
Bundler.setup :default
require "sinatra/base"
require "sinatra/json"
require 'sprockets'
require './app/routes'
require 'action_mailer'
# require 'sinatra/assetpack'

class GMEIDIApplication < Sinatra::Base
  helpers Sinatra::JSON
  register Sinatra::GMEIDI::Routing



  # register Sinatra::AssetPack

  # assets {
  #   serve '/javascripts',     from: 'app/assets/javascripts'        # Default
  #   serve '/stylesheets',    from: 'app/assets/stylesheets'       # Default
  #   serve '/images', from: 'app/assets/images'    # Default

  #   # The second parameter defines where the compressed version will be served.
  #   # (Note: that parameter is optional, AssetPack will figure it out.)
  #   # The final parameter is an array of glob patterns defining the contents
  #   # of the package (as matched on the public URIs, not the filesystem)
  #   js :app, '/javascripts/main.js', [
  #     '/javascripts/vendor/*.js',
  #     '/javascripts/coffee/*.js'
  #   ]

  #   css :application, '/stylesheets/main.css', [
  #     '/stylesheets/scss/main.scss'
  #   ]

  #   js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
  #   css_compression :simple   # :simple | :sass | :yui | :sqwish
  # }
end